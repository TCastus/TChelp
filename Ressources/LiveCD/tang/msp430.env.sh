# -*-sh-*-

function go_mspgcc()
{
    export MSPHOME=/opt/msp430/
    export MSP430DIR=${MSPHOME}/msp430-gcc-9.3.1.11_linux64
    export MSPINCLUDES=${MSPHOME}/msp430-gcc-support-files/include
    export MSPLDLIBS=${MSPINCLUDES}
    export MSP430_GCC_INCLUDE_DIR=${MSPINCLUDES}
    
    export MSPGCCDIR=${MSP430DIR}
    export MSP430PREFIX=msp430-elf
    export CC=${MSP430PREFIX}-gcc
    export LD=${MSP430PREFIX}-ld
    export MSPFLAGS=-mhwmult=none
    
    export PATH=${PATH}:${MSPGCCDIR}/bin
    export PS1='[MSPGCC8]'${PS1}
}


