%define BPM 100

%include "sointu/header.inc"

BEGIN_PATTERNS
    PATTERN 64,HLD,HLD,HLD,HLD,HLD,HLD,HLD,0,0,0,0,0,0,0,0
END_PATTERNS

BEGIN_TRACKS
    TRACK VOICES(1),0
END_TRACKS

BEGIN_PATCH
    BEGIN_INSTRUMENT VOICES(1)
        SU_LOADVAL MONO,VALUE(0)
        SU_LOADVAL MONO,VALUE(128)
        SU_OUTAUX  STEREO,OUTGAIN(16),AUXGAIN(48)
        SU_IN      MONO,CHANNEL(1)
        SU_IN      MONO,CHANNEL(0)
        SU_IN      MONO,CHANNEL(3)
        SU_IN      MONO,CHANNEL(2)
        SU_ADDP    STEREO
        SU_OUT     STEREO,GAIN(128)
    END_INSTRUMENT
END_PATCH

%include "sointu/footer.inc"
