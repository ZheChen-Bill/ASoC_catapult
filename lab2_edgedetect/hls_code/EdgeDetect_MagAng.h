#pragma once

#include "EdgeDetect_defs.h"
#include <mc_scverify.h>


//namespace EdgeDetect_IP 
//{
  class EdgeDetect_MagAng
  {
  public:
    EdgeDetect_MagAng() {}
  
    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<gradType4x>  &dx_in,
                        ac_channel<gradType4x>  &dy_in,
                        ac_channel<pixelType4x> &pix_in,
                        maxWType                &widthIn,
                        maxHType                &heightIn,
                        bool                    &sw_in,
                        uint32                  &crc32_pix_in,
                        uint32                  &crc32_dat_out,
                        ac_channel<Stream_t>    &dat_out)
    {
      gradType4x dx, dy;
      pixelType4x pix;
      sqType dx_sq;
      sqType dy_sq;
      sumType sum; // fixed point integer for sqrt
      ac_fixed<16,9,false> sq_rt; // square-root return type
      magType4x magn;
      magType4x magn_out;
      Stream_t dat;
      maxWType x4;
      uint32 crc32_pix_in_tmp = 0XFFFFFFFF;
      uint32 crc32_dat_out_tmp = 0XFFFFFFFF;
  
      MROW: for (maxHType y = 0; ; y++) {
        #pragma hls_pipeline_init_interval 1
        MCOL: for (maxWType x = 0; ; x+=4) {
          x4 = x / 4;
          
          dx = dx_in.read();
          dy = dy_in.read();
          pix = pix_in.read();
#ifdef USE_SAD
          pixelType abs_dx, abs_dy;

          #pragma hls_unroll yes
          for(int i=0; i < 4; i++)
          {
            ac_math::ac_abs(dx.slc<9>(i*9), abs_dx);
            ac_math::ac_abs(dy.slc<9>(i*9), abs_dy);
            uint9 abs_sum = abs_dx + abs_dy; 
            ac_fixed<8,8,false,AC_TRN,AC_SAT> abs_sum_clip = abs_sum;
            magType tmp = (magType) abs_sum_clip.to_uint();
            magn.set_slc(i*8, tmp);
          }

          if (!sw_in)
            magn_out = pix;
          else
            magn_out = magn;
#else
          #pragma hls_unroll yes
          for(int i=0; i < 4; i++)
          {
            dx_sq = dx.slc<9>(i*9) * dx.slc<9>(i*9);
            dy_sq = dy.slc<9>(i*9) * dy.slc<9>(i*9);
            sum = dx_sq + dy_sq;
            // Catapult's math library piecewise linear implementation of sqrt and atan2
            ac_math::ac_sqrt_pwl(sum,sq_rt);
            magType tmp = sq_rt.to_uint();
            magn.set_slc(i*8, tmp);
          }         

          if (!sw_in)
            magn_out = pix;
          else
            magn_out = magn;
#endif

          dat.pix = magn_out;
          dat.sof = (x4==0 && y==0);
          dat.eol = (x4== maxWType(widthIn/4-1));

          dat_out.write(dat);
   
          crc32_pix_in_tmp  = calc_crc32<32>(crc32_pix_in_tmp,  pix);
          crc32_dat_out_tmp = calc_crc32<32>(crc32_dat_out_tmp, magn_out);

          // programmable width exit condition
          if (x4 == maxWType(widthIn/4-1)) { // cast to maxWType for RTL code coverage
            break;
          }
        }
        // programmable height exit condition
        if (y == maxHType(heightIn-1)) { // cast to maxHType for RTL code coverage
          break;
        }
      }
 
      crc32_pix_in  = ~crc32_pix_in_tmp;
      crc32_dat_out = ~crc32_dat_out_tmp;
    }

  private:
    template <int len>
    uint32 calc_crc32(uint32 crc_in, ac_int<len, false> dat_in)
    {
      const uint32 CRC_POLY = 0xEDB88320;
      uint32 crc_tmp = crc_in;

      #pragma hls_unroll yes
      for(int i=0; i<len; i++)
      {
        uint1 tmp_bit = crc_tmp[0] ^ dat_in[i];

        uint31 mask;

        #pragma hls_unroll yes
        for(int i=0; i<31; i++)
          mask[i] = tmp_bit & CRC_POLY[i];

        uint31 crc_tmp_h31 = crc_tmp.slc<31>(1);
   
        crc_tmp_h31 ^= mask;
        
        crc_tmp.set_slc(31,tmp_bit);
        crc_tmp.set_slc(0,crc_tmp_h31);
      }
      return crc_tmp;
    }
    
  };

//}


