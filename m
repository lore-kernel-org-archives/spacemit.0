Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436FE31ED81
	for <spacemit@lists.linux.dev>; Fri, 17 Apr 2026 06:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776406102; cv=pass; b=Rrjgy+4EwcEKueJdI0hI5Wo97CbiGCgsxr2P7o7dmYUxrpdUhRlNlKn81zeNBurFTqulUDgiVjEvUntw+5It2mnv7tIS4yC07YaiQndFXEhc1mZRR63h5EeCf6JG68CUScqD6tXky7PEIgJtKsfHaPuRdv5iBOfum5ce7kUuH9w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776406102; c=relaxed/simple;
	bh=4I9KDWhmSmty8TTse7oKW3MNvUhbbhwfrwol3PD9qJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PO3OCIPbrXFsaYA6YPIxr1fYDW7HQ4wEGRE/43Em/1MMNQYxoyLBzD6qb8kC9RP1kIIXUx4tmJWPOmLrSwfGhunkGLhlGIQqArw3tvzKiH74m1m9jM/a8hgId3/ekLvjkonftui83q6N89ISTepvXhKU2F8VWXBYuVfRqIJWn6E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZNPwras; arc=pass smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZNPwras"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b9c6680aaf8so65600066b.3
        for <spacemit@lists.linux.dev>; Thu, 16 Apr 2026 23:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776406099; cv=none;
        d=google.com; s=arc-20240605;
        b=lvu2PB5YwrFexnQXWtHGq5QMdqKbrYROUgOzYuquc68wzwTD1ka074yZkL1w+cCNVa
         33tzIPB6zEP4AwhxWgSU17aZbHxWoF36Srqyt0Bh9vK7wePiidDWksqRFkcGZKO/PJuo
         j7exk5/Wdwmv8H+kvhiIcJoFase16B10DTsKNGRg4oRVK6SUOsmNyGshRKHLXiZWj+l6
         26dBIfoYSWGmUWRcqQqTvjRxtopxiymxi/CrdBQNu2h3tRBdpQ4cg2GdF/Muu6h2/wPX
         qzoQhBv8BA5hqlgLbJZlT03wnQG8VPi0830FDzGbU8xPlzvZfct7UxtKDupc6+SWF+eh
         82Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZOSLvNmc8Bu2G638G5DrxvmHFE9dj+oxa3y67ns4d3M=;
        fh=87sJrNiCL8DGMuqfi91hUqtHnEGRPJmhQMVREstdUTs=;
        b=ixLHrUH2aYCKyxOHdyoXeGK/gvzoAgxQw2iSG0N9IOjLIG5fCFt00gALJoGgnRcqAn
         ITjUx9wrpQYNR82GZ+6fFei3vMVec8lV9hdp44lPvT4fSQvtCCFAhMTR4rTZ5oeCmBPR
         +HPwL5nOgLldYePttD+t8wStAkLJy6UaY26wkGA18g4Wagcj6Ubw6OkSw+8ZDzT1/ptt
         s18noy3xDjoGYFyMnm4cWe28AA8oybB9xDOj5EZtup9nkNp6VWKjmzQ4iIYAWTYyFTKV
         h8aCobkqBcHv4pRsRV3pKSpattToxzIwtQ801t4keN4hptolm8zsxdB5EeFXFLVZzpwM
         kdQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776406099; x=1777010899; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOSLvNmc8Bu2G638G5DrxvmHFE9dj+oxa3y67ns4d3M=;
        b=HZNPwrasXf0ns20gyltoxndtZxoLno1u6P2dYCLCCc/7VABNiaKZGAitxwwjUdCGuF
         /RrqmFVwhafQw0MI3caGG4/GJsybpmaunHOw0sUlnZikRZEf8bjsm+Nqfy5pQ0TrbSwT
         LySr+LSVwYZxwlQbM/m5RwQcY56ZgYjgaP5lILz2GmtS1koBMvXJ6pRdYCZUWsRvJoLy
         p0oLfKUuXgjkZKBjbX9nMomu95Fu3tbD92a44/gI12p9tHTCf4ys+kiiW8pvp3r4sgY9
         18LVPkk2REn+xp+/5HQ/Q06IrH6my+CmYM2uiB8jYBeKUkxhU4wt6tkXKw517744C7gU
         +bXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776406099; x=1777010899;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZOSLvNmc8Bu2G638G5DrxvmHFE9dj+oxa3y67ns4d3M=;
        b=J98dsdDl49IWfUt0v8PpE6ZTiTobaI4az1r1X2d2xiinfraO/BDlm+HW7TmvWJtaKK
         eiegYJC40QfbMbp6P2rIOUJ6hTJDuTYuINMecNWrUZRqA4bpErADSQKflnTWUxLLg/XU
         qMRs7H5HmzD7wFtzdcBhRwFHmEcB2MK3SXz6G+56uJ83eu6YbtE4VwyAQukURhmcouLk
         5yvGdHNqpg2QRvPo+UxTlGRDr17fWANxb1OQwneyl9iSi8uKPVN1qr+xxKxSf1j1Wv5J
         UPhAPteNtdxeDI8STAXZFaPgmYgH7OjOh6Aukr22GZcNuXAfhWISJoExRDjo/utiMPnu
         ToLA==
X-Forwarded-Encrypted: i=1; AFNElJ+v3oKBDgpuN791lsDERf4gXi8KBBYsc4giGEniMArNyZwfR4aNltnv+sj8A6D5NHHrgCimewTaow==@lists.linux.dev
X-Gm-Message-State: AOJu0YxbJ3gSgL7jmhcgIsM/Jwlx5Bhp8uz977qllEwEEn6ExB4HmYsB
	R15K1J5rqF63s695LZ4fL1aGD2YpBPlaseNtWjp7kawwyyDxPkkz67TP6hUpNw8WhjqWoSHBAvf
	nCVNn+xx+X78VowTxW7LqiNslQnvBfa4=
X-Gm-Gg: AeBDies+yNuBogkwBnWbtAhG5TbqCPbac0K5th0kmx3luWPpTlE9sY6eSEsjoNqtSzd
	4rPUVS9UKH+02Fqlk6oDmxrlHBmvlslDOSAAPwXy7ZZBJsLaNrbIhwpcaPaQGcBBLnUCWBO4Ec2
	FG2PUk6pIANTw3S7z/74MRVbpypICQSkFdpst2ll2ofQ8aiCnT2eey4FYVwdggY7y1lH0i79vQ3
	lii0sUWWDScRus4OAbltfFgtDEgJtatVuR1mwQ9HFanzNbY6epIBLlMtp0WiLE9lPKSYH1SKCff
	OZ/QQhF1bzP5zACo
X-Received: by 2002:a17:907:7213:b0:ba4:74c8:5395 with SMTP id
 a640c23a62f3a-ba474c85791mr29081866b.43.1776406096955; Thu, 16 Apr 2026
 23:08:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org>
 <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org> <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
 <DHUCL24GMX7D.369IWK9DLPZPX@mailbox.org> <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
In-Reply-To: <CANAwSgRt5-t_ah=phGc+CQYHG-CdWJuOX-2VTW6xE7n7EnVsFw@mail.gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Fri, 17 Apr 2026 11:38:00 +0530
X-Gm-Features: AQROBzDNo_Jbpb506zdLdwHA3v0y6k5qBlqSi2s7aO574ECOfW7q53AREy70elk
Message-ID: <CANAwSgRYqb6oYT3JmkfiN4VRtUwFdX1myoHn+vBeFZUhonCdsw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shuwei,

On Thu, 16 Apr 2026 at 17:07, Anand Moon <linux.amoon@gmail.com> wrote:
>
> Hi Shuwei,
>
> Thanks for sharing the details.
>
> On Thu, 16 Apr 2026 at 11:29, Shuwei Wu <shuwei.wu@mailbox.org> wrote:
> >
> > On Tue Apr 14, 2026 at 9:25 PM CST, Anand Moon wrote:
> > > Hi Shuwei,
> > >
> > > On Fri, 10 Apr 2026 at 13:30, Shuwei Wu <shuwei.wu@mailbox.org> wrote=
:
> > >>
> > >> Add Operating Performance Points (OPP) tables and CPU clock properti=
es
> > >> for the two clusters in the SpacemiT K1 SoC.
> > >>
> > >> Also assign the CPU power supply (cpu-supply) for the Banana Pi BPI-=
F3
> > >> board to fully enable CPU DVFS.
> > >>
> > >> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> > >>
> > >> ---
> > >> Changes in v2:
> > >> - Add k1-opp.dtsi with OPP tables for both CPU clusters
> > >> - Assign CPU supplies and include OPP table for Banana Pi BPI-F3
> > >> ---
> > >>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
> > >>  arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 +++++++++++++=
+++++++++++
> > >>  arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
> > >>  3 files changed, 147 insertions(+), 1 deletion(-)
> > >>
> > >> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/=
riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > >> index 444c3b1e6f44..3780593f610d 100644
> > >> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > >> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > >> @@ -5,6 +5,7 @@
> > >>
> > >>  #include "k1.dtsi"
> > >>  #include "k1-pinctrl.dtsi"
> > >> +#include "k1-opp.dtsi"
> > >>
> > >>  / {
> > >>         model =3D "Banana Pi BPI-F3";
> > >> @@ -86,6 +87,38 @@ &combo_phy {
> > >>         status =3D "okay";
> > >>  };
> > >>
> > >> +&cpu_0 {
> > >> +       cpu-supply =3D <&buck1_3v45>;
> > >> +};
> > >> +
> > >> +&cpu_1 {
> > >> +       cpu-supply =3D <&buck1_3v45>;
> > >> +};
> > >> +
> > >> +&cpu_2 {
> > >> +       cpu-supply =3D <&buck1_3v45>;
> > >> +};
> > >> +
> > >> +&cpu_3 {
> > >> +       cpu-supply =3D <&buck1_3v45>;
> > >> +};
> > >> +
> > >> +&cpu_4 {
> > >> +       cpu-supply =3D <&buck1_3v45>;
> > >> +};
> > >> +
> > >> +&cpu_5 {
> > >> +       cpu-supply =3D <&buck1_3v45>;
> > >> +};
> > >> +
> > >> +&cpu_6 {
> > >> +       cpu-supply =3D <&buck1_3v45>;
> > >> +};
> > >> +
> > >> +&cpu_7 {
> > >> +       cpu-supply =3D <&buck1_3v45>;
> > >> +};
> > >> +
> > >>  &emmc {
> > >>         bus-width =3D <8>;
> > >>         mmc-hs400-1_8v;
> > >> @@ -201,7 +234,7 @@ pmic@41 {
> > >>                 dldoin2-supply =3D <&buck5>;
> > >>
> > >>                 regulators {
> > >> -                       buck1 {
> > >> +                       buck1_3v45: buck1 {
> > >>                                 regulator-min-microvolt =3D <500000>=
;
> > >>                                 regulator-max-microvolt =3D <3450000=
>;
> > >>                                 regulator-ramp-delay =3D <5000>;
> > >> diff --git a/arch/riscv/boot/dts/spacemit/k1-opp.dtsi b/arch/riscv/b=
oot/dts/spacemit/k1-opp.dtsi
> > >> new file mode 100644
> > >> index 000000000000..768ae390686d
> > >> --- /dev/null
> > >> +++ b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
> > >> @@ -0,0 +1,105 @@
> > >> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > >> +
> > >> +/ {
> > >> +       cluster0_opp_table: opp-table-cluster0 {
> > >> +               compatible =3D "operating-points-v2";
> > >> +               opp-shared;
> > >> +
> > >> +               opp-614400000 {
> > >> +                       opp-hz =3D /bits/ 64 <614400000>;
> > >> +                       opp-microvolt =3D <950000>;
> > >> +                       clock-latency-ns =3D <200000>;
> > >> +               };
> > >> +
> > >> +               opp-819000000 {
> > >> +                       opp-hz =3D /bits/ 64 <819000000>;
> > >> +                       opp-microvolt =3D <950000>;
> > >> +                       clock-latency-ns =3D <200000>;
> > >> +               };
> > >> +
> > >> +               opp-1000000000 {
> > >> +                       opp-hz =3D /bits/ 64 <1000000000>;
> > >> +                       opp-microvolt =3D <950000>;
> > >> +                       clock-latency-ns =3D <200000>;
> > >> +               };
> > >> +
> > >> +               opp-1228800000 {
> > >> +                       opp-hz =3D /bits/ 64 <1228800000>;
> > >> +                       opp-microvolt =3D <950000>;
> > >> +                       clock-latency-ns =3D <200000>;
> > >> +               };
> > >> +
> > >> +               opp-1600000000 {
> > >> +                       opp-hz =3D /bits/ 64 <1600000000>;
> > >> +                       opp-microvolt =3D <1050000>;
> > >> +                       clock-latency-ns =3D <200000>;
> > >> +               };
> > >> +       };
> > >> +
> > >> +       cluster1_opp_table: opp-table-cluster1 {
> > >> +               compatible =3D "operating-points-v2";
> > >> +               opp-shared;
> > >> +
> > >> +               opp-614400000 {
> > >> +                       opp-hz =3D /bits/ 64 <614400000>;
> > >> +                       opp-microvolt =3D <950000>;
> > >> +                       clock-latency-ns =3D <200000>;
> > >> +               };
> > >> +
> > >> +               opp-819000000 {
> > >> +                       opp-hz =3D /bits/ 64 <819000000>;
> > >> +                       opp-microvolt =3D <950000>;
> > >> +                       clock-latency-ns =3D <200000>;
> > >> +               };
> > >> +
> > >> +               opp-1000000000 {
> > >> +                       opp-hz =3D /bits/ 64 <1000000000>;
> > >> +                       opp-microvolt =3D <950000>;
> > >> +                       clock-latency-ns =3D <200000>;
> > >> +               };
> > >> +
> > >> +               opp-1228800000 {
> > >> +                       opp-hz =3D /bits/ 64 <1228800000>;
> > >> +                       opp-microvolt =3D <950000>;
> > >> +                       clock-latency-ns =3D <200000>;
> > >> +               };
> > >> +
> > >> +               opp-1600000000 {
> > >> +                       opp-hz =3D /bits/ 64 <1600000000>;
> > >> +                       opp-microvolt =3D <1050000>;
> > >> +                       clock-latency-ns =3D <200000>;
> > >> +               };
> > >> +       };
> > >> +};
> > >> +
> > >> +&cpu_0 {
> > >> +       operating-points-v2 =3D <&cluster0_opp_table>;
> > >> +};
> > >> +
> > >> +&cpu_1 {
> > >> +       operating-points-v2 =3D <&cluster0_opp_table>;
> > >> +};
> > >> +
> > >> +&cpu_2 {
> > >> +       operating-points-v2 =3D <&cluster0_opp_table>;
> > >> +};
> > >> +
> > >> +&cpu_3 {
> > >> +       operating-points-v2 =3D <&cluster0_opp_table>;
> > >> +};
> > >> +
> > >> +&cpu_4 {
> > >> +       operating-points-v2 =3D <&cluster1_opp_table>;
> > >> +};
> > >> +
> > >> +&cpu_5 {
> > >> +       operating-points-v2 =3D <&cluster1_opp_table>;
> > >> +};
> > >> +
> > >> +&cpu_6 {
> > >> +       operating-points-v2 =3D <&cluster1_opp_table>;
> > >> +};
> > >> +
> > >> +&cpu_7 {
> > >> +       operating-points-v2 =3D <&cluster1_opp_table>;
> > >> +};
> > >> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/=
dts/spacemit/k1.dtsi
> > >> index 529ec68e9c23..bdd109b81730 100644
> > >> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> > >> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> > >> @@ -54,6 +54,7 @@ cpu_0: cpu@0 {
> > >>                         compatible =3D "spacemit,x60", "riscv";
> > >>                         device_type =3D "cpu";
> > >>                         reg =3D <0>;
> > >> +                       clocks =3D <&syscon_apmu CLK_CPU_C0_CORE>;
> > >>                         riscv,isa =3D "rv64imafdcbv_zicbom_zicbop_zi=
cboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt=
_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
> > >>                         riscv,isa-base =3D "rv64i";
> > >>                         riscv,isa-extensions =3D "i", "m", "a", "f",=
 "d", "c", "b", "v", "zicbom",
> > >> @@ -84,6 +85,7 @@ cpu_1: cpu@1 {
> > >>                         compatible =3D "spacemit,x60", "riscv";
> > >>                         device_type =3D "cpu";
> > >>                         reg =3D <1>;
> > >> +                       clocks =3D <&syscon_apmu CLK_CPU_C0_CORE>;
> > >
> > > Based on the Spacemit kernel source, the k1-x_opp_table.dtsi file
> > > defines several additional clocks for the Operating Performance Point=
s
> > > (OPP) table:
> > >
> > >  clocks =3D <&ccu CLK_CPU_C0_ACE>, <&ccu CLK_CPU_C1_ACE>, <&ccu CLK_C=
PU_C0_TCM>,
> > >                         <&ccu CLK_CCI550>, <&ccu CLK_PLL3>, <&ccu
> > > CLK_CPU_C0_HI>, <&ccu CLK_CPU_C1_HI>;
> > >                 clock-names =3D "ace0","ace1","tcm","cci","pll3", "c0=
hi", "c1hi";
> > >
> > > These hardware clocks are also explicitly registered in the APMU cloc=
k driver
> > > via the k1_ccu_apmu_hws array, confirming their availability for freq=
uency
> > > and voltage scaling on the K1-X SoC.
> > >
> > > static struct clk_hw *k1_ccu_apmu_hws[] =3D {
> > >         [CLK_CCI550]            =3D &cci550_clk.common.hw,
> > >         [CLK_CPU_C0_HI]         =3D &cpu_c0_hi_clk.common.hw,
> > >         [CLK_CPU_C0_CORE]       =3D &cpu_c0_core_clk.common.hw,
> > >         [CLK_CPU_C0_ACE]        =3D &cpu_c0_ace_clk.common.hw,
> > >         [CLK_CPU_C0_TCM]        =3D &cpu_c0_tcm_clk.common.hw,
> > >         [CLK_CPU_C1_HI]         =3D &cpu_c1_hi_clk.common.hw,
> > >         [CLK_CPU_C1_CORE]       =3D &cpu_c1_core_clk.common.hw,
> > >         [CLK_CPU_C1_ACE]        =3D &cpu_c1_ace_clk.common.hw,
> > >
> > > Yes, it is possible to add these clocks for DVFS to work correctly,
> > > provided they are managed by the appropriate driver and declared in
> > > the Device Tree (DT).
> > >
> > > Thanks
> > > -Anand
> >
> > Thanks for your review and for pointing this out.
> >
> > Regarding the clocks you mentioned, I'd like to clarify their roles bas=
ed on
> > the K1 datasheet. Taking Cluster 0 as an example, c0_core_clk is the pr=
imary
> > clock for the cluster. c0_ace_clk and c0_tcm_clk are children derived f=
rom it,
> > defaulting to half the frequency of their parent core clock, while c0_h=
i_clk
> > represents the high-speed path selection.
> > Cluster 1 follows the same structure.
> >
> > Based on the official SpacemiT Bianbu OS source, the spacemit-cpufreq.c=
 driver
> > mainly performs the following tasks:
> > 1. Sets the CCI550 clock frequency to 614MHz.
> > 2. Sets the clock frequencies of c0_ace_clk, c1_ace1_clk, and c0_tcm_cl=
k to half
> > the frequency of their parent clock.
> > 3. For the 1.6GHz OPP, it sets the PLL3 frequency to 3.2GHz and the
> > c0_hi_clk/c1_hi_clk frequencies to 1.6GHz.
> >
> > I booted with the manufacturer's OpenWRT image and used debugfs to conf=
irm that
> > the clock states are exactly as described above.
> >
> > At 1.6GHz:
> > Clock Source & Tree           Rate (Hz)      HW Enable  Consumer
> > -----------------------------------------------------------------------=
----
> > pll3                          3,200,000,000      Y      deviceless
> >  =E2=94=94=E2=94=80 pll3_d2                   1,600,000,000      Y     =
 deviceless
> >      =E2=94=9C=E2=94=80 cpu_c1_hi_clk         1,600,000,000      Y     =
 deviceless
> >      =E2=94=82   =E2=94=94=E2=94=80 cpu_c1_pclk       1,600,000,000    =
  Y      cpu0
> >      =E2=94=82       =E2=94=94=E2=94=80 cpu_c1_ace_clk  800,000,000    =
  Y      deviceless
> >      =E2=94=94=E2=94=80 cpu_c0_hi_clk         1,600,000,000      Y     =
 deviceless
> >          =E2=94=94=E2=94=80 cpu_c0_core_clk   1,600,000,000      Y     =
 cpu0
> >              =E2=94=9C=E2=94=80 cpu_c0_tcm_clk  800,000,000      Y     =
 deviceless
> >              =E2=94=94=E2=94=80 cpu_c0_ace_clk  800,000,000      Y     =
 deviceless
> >
> > pll1_2457p6_vco               2,457,600,000      Y      deviceless
> >  =E2=94=94=E2=94=80 pll1_d4                     614,400,000      Y     =
 deviceless
> >      =E2=94=94=E2=94=80 pll1_d4_614p4           614,400,000      Y     =
 deviceless
> >          =E2=94=94=E2=94=80 cci550_clk          614,400,000      Y     =
 deviceless
> >
> > At 1.228GHz:
> > Clock Source & Tree           Rate (Hz)      HW Enable  Consumer
> > -----------------------------------------------------------------------=
----
> > pll1_2457p6_vco               2,457,600,000      Y      deviceless
> >  =E2=94=94=E2=94=80 pll1_d2                   1,228,800,000      Y     =
 deviceless
> >      =E2=94=94=E2=94=80 pll1_d2_1228p8        1,228,800,000      Y     =
 deviceless
> >          =E2=94=9C=E2=94=80 cpu_c0_core_clk   1,228,800,000      Y     =
 cpu0
> >          =E2=94=82   =E2=94=9C=E2=94=80 cpu_c0_tcm_clk  614,400,000    =
  Y      deviceless
> >          =E2=94=82   =E2=94=94=E2=94=80 cpu_c0_ace_clk  614,400,000    =
  Y      deviceless
> >          =E2=94=94=E2=94=80 cpu_c1_pclk       1,228,800,000      Y     =
 cpu0
> >              =E2=94=94=E2=94=80 cpu_c1_ace_clk  614,400,000      Y     =
 deviceless
> >   =E2=94=94=E2=94=80 pll1_d4                     614,400,000      Y    =
  deviceless
> >      =E2=94=94=E2=94=80 pll1_d4_614p4           614,400,000      Y     =
 deviceless
> >          =E2=94=94=E2=94=80 cci550_clk          614,400,000      Y     =
 deviceless
> >
> > pll3                          3,200,000,000      Y      deviceless
> >  =E2=94=94=E2=94=80 pll3_d2                   1,600,000,000      Y     =
 deviceless
> >      =E2=94=9C=E2=94=80 cpu_c1_hi_clk         1,600,000,000      Y     =
 deviceless
> >      =E2=94=94=E2=94=80 cpu_c0_hi_clk         1,600,000,000      Y     =
 deviceless
> >  =E2=94=94=E2=94=80 pll3_d3                   1,066,666,666      Y     =
 deviceless
> >
> > Regarding the necessity of listing these clocks in the DT, my analysis =
is as follows:
> > 1. For CCI550, I did not find a clear definition of this clock's specif=
ic role
> > in the SoC datasheet. Although the vendor kernel increases its frequenc=
y,
> > my benchmarks show that maintaining the mainline default (245.76MHz) ha=
s a
> > negligible impact on CPU performance.
> > 2. For ACE and TCM clocks, they function as synchronous children of the=
 core
> > clock with a default divide-by-2 ratio. Since they scale automatically =
relative
> > to c0_core_clk/c1_core_clk and no other peripherals depend on them, the=
y do not
> > require manual management in the OPP table.
> > 3. For the high-speed path, the underlying clock controller logic alrea=
dy handles
> > the parent MUX switching and PLL3 scaling automatically when clk_set_ra=
te()
> > is called on the core clock.
> >
> > I have verified this by checking the hardware state in the mainline ker=
nel.
> > The clock tree matches the vendor kernel's configuration:
> >
> > At 1.6GHz:
> > Clock Source & Tree           Rate (Hz)      HW Enable  Consumer
> > -----------------------------------------------------------------------=
----
> > pll3                          3,200,000,000      Y      deviceless
> >  =E2=94=94=E2=94=80 pll3_d2                   1,600,000,000      Y     =
 deviceless
> >      =E2=94=9C=E2=94=80 cpu_c1_hi_clk         1,600,000,000      Y     =
 deviceless
> >      =E2=94=82   =E2=94=94=E2=94=80 cpu_c1_core_clk   1,600,000,000    =
  Y      cpu4
> >      =E2=94=82       =E2=94=94=E2=94=80 cpu_c1_ace_clk  800,000,000    =
  Y      deviceless
> >      =E2=94=94=E2=94=80 cpu_c0_hi_clk         1,600,000,000      Y     =
 deviceless
> >          =E2=94=94=E2=94=80 cpu_c0_core_clk   1,600,000,000      Y     =
 cpu0
> >              =E2=94=9C=E2=94=80 cpu_c0_tcm_clk  800,000,000      Y     =
 deviceless
> >              =E2=94=94=E2=94=80 cpu_c0_ace_clk  800,000,000      Y     =
 deviceless
> >
> > pll1                          2,457,600,000      Y      deviceless
> >  =E2=94=94=E2=94=80 pll1_d5                     491,520,000      Y     =
 deviceless
> >      =E2=94=94=E2=94=80 pll1_d5_491p52          491,520,000      Y     =
 deviceless
> >          =E2=94=94=E2=94=80 cci550_clk          245,760,000      Y     =
 deviceless
> >
> > At 1.228GHz:
> > Clock Source & Tree           Rate (Hz)      HW Enable  Consumer
> > -----------------------------------------------------------------------=
----
> > pll1                          2,457,600,000      Y      deviceless
> >  =E2=94=9C=E2=94=80 pll1_d5                     491,520,000      Y     =
 deviceless
> >  =E2=94=82   =E2=94=94=E2=94=80 pll1_d5_491p52          491,520,000    =
  Y      deviceless
> >  =E2=94=82       =E2=94=94=E2=94=80 cci550_clk          245,760,000    =
  Y      deviceless
> >  =E2=94=94=E2=94=80 pll1_d2                   1,228,800,000      Y     =
 deviceless
> >      =E2=94=94=E2=94=80 pll1_d2_1228p8        1,228,800,000      Y     =
 deviceless
> >          =E2=94=94=E2=94=80 cpu_c0_core_clk   1,228,800,000      Y     =
 cpu0
> >              =E2=94=9C=E2=94=80 cpu_c0_tcm_clk  614,400,000      Y     =
 deviceless
> >              =E2=94=94=E2=94=80 cpu_c0_ace_clk  614,400,000      Y     =
 deviceless
> >
> > pll3                          3,200,000,000      Y      deviceless
> >  =E2=94=94=E2=94=80 pll3_d2                   1,600,000,000      Y     =
 deviceless
> >      =E2=94=94=E2=94=80 cpu_c1_hi_clk         1,600,000,000      Y     =
 deviceless
> >          =E2=94=94=E2=94=80 cpu_c1_core_clk   1,600,000,000      Y     =
 cpu4
> >              =E2=94=94=E2=94=80 cpu_c1_ace_clk  800,000,000      Y     =
 deviceless
> >
>
> Thanks, I have verified the clocks are set to Y in
> /sys/kernel/debug/clk/clk_summary
>
> > Performance benchmarks also confirm that the current configuration is s=
ufficient:
> > Benchmark (AWK computation): time awk 'BEGIN{for(i=3D0;i<10000000;i++) =
sum+=3Di}'
> > -----------------------------------------------------------------------=
-----
> > Frequency    |      Mainline Linux (s)       |        OpenWrt (s)
> > (kHz)        |  Real (Total) |  User (CPU)   |  Real (Total) |  User (C=
PU) )
> > -------------+---------------+---------------+---------------+---------=
-----
> > 1,600,000    |     1.82s     |     1.81s     |     1.73s     |    1.73s
> > 1,228,800    |     2.34s     |     2.33s     |     2.26s     |    2.26s
> > 1,000,000    |     2.94s     |     2.86s     |     2.78s     |    2.78s
> >   819,000    |     3.54s     |     3.53s     |     3.39s     |    3.39s
> >   614,400    |     4.73s     |     4.71s     |     4.51s     |    4.51s
> > -----------------------------------------------------------------------=
-----
> >
> > In summary, because the clock controller correctly handles the internal=
 dividers
> > and parent switching, declaring only the primary core clock for each CP=
U node is
> > sufficient for functional DVFS.
> >
> I have just tested this patch against  next-20260415
> But, I have observed this log on the Banana Pi F3 dev board with the
> Banana PI - R4 heat sink and fan.
>
> [    5.803445][    T1] In-situ OAM (IOAM) with IPv6
> [    5.809605][    T1] NET: Registered PF_PACKET protocol family
> [    5.819098][    T1] Key type dns_resolver registered
> [    5.853430][    C2] cpu2: scalar unaligned word access speed is
> 1.60x byte access speed (fast)
> [    5.853431][    C3] cpu3: scalar unaligned word access speed is
> 1.67x byte access speed (fast)
> [    5.853440][    C7] cpu7: scalar unaligned word access speed is
> 8.10x byte access speed (fast)
> [    5.853432][    C1] cpu1: scalar unaligned word access speed is
> 3.98x byte access speed (fast)
> [    5.853431][    T1] cpu0: scalar unaligned word access speed is
> 2.33x byte access speed (fast)
> [    5.853436][    C5] cpu5: scalar unaligned word access speed is
> 2.29x byte access speed (fast)
> [    5.853436][    C6] cpu6: scalar unaligned word access speed is
> 2.58x byte access speed (fast)
> [    5.853431][    C4] cpu4: scalar unaligned word access speed is
> 2.07x byte access speed (fast)
> [    5.936544][   T92] mmcblk0boot0: mmc0:0001 AJTD4R 4.00 MiB
> [    6.003120][   T92] mmcblk0boot1: mmc0:0001 AJTD4R 4.00 MiB
> [    6.070909][   T92] mmcblk0rpmb: mmc0:0001 AJTD4R 4.00 MiB, chardev (2=
44:0)
> [    6.380324][    T1] registered taskstats version 1
> [    6.407337][    T1] Loading compiled-in X.509 certificates
> [    6.594206][    T1] Loaded X.509 cert 'Build time autogenerated
> kernel key: 19b81ec48e45e6ee983623417bad5096df8bbcf1'
> [    7.600343][    T1] Demotion targets for Node 0: null
> [    7.608583][    T1] kmemleak: Kernel memory leak detector
> initialized (mem pool available: 1309)
> [    7.608646][  T120] kmemleak: Automatic memory scanning thread started
> [    7.624663][    T1] debug_vm_pgtable: [debug_vm_pgtable         ]:
> Validating architecture page table helpers
> [    7.636721][    T1] page_owner is disabled
> [    8.213648][   T74] debugfs: ':soc:gpio@d4019000-1' already exists
> in 'domains'
> [    8.233502][   T74] debugfs: ':soc:gpio@d4019000-1' already exists
> in 'domains'
> [    8.254012][   T74] debugfs: ':soc:gpio@d4019000-1' already exists
> in 'domains'
> [    8.319431][   T74] printk: legacy console [ttyS0] disabled
> [    8.345811][   T74] d4017000.serial: ttyS0 at MMIO 0xd4017000 (irq
> =3D 16, base_baud =3D 921600) is a XScale
> [    8.357331][   T74] printk: legacy console [ttyS0] enabled
> [    8.357331][   T74] printk: legacy console [ttyS0] enabled
> [    8.369971][   T74] printk: legacy bootconsole [uart0] disabled
> [    8.369971][   T74] printk: legacy bootconsole [uart0] disabled
> [    8.427040][   T74] /soc/i2c@d401d800/pmic@41: Fixed dependency
> cycle(s) with /soc/i2c@d401d800/pmic@41/regulators/buck5
> [    8.634595][   T74] spacemit-p1-rtc spacemit-p1-rtc.1.auto:
> registered as rtc0
> [    8.642732][   T74] spacemit-p1-rtc spacemit-p1-rtc.1.auto: setting
> system clock to 2026-04-10T00:03:42 UTC (1775779422)
> [    8.766081][   T74] sdhci-spacemit d4280000.mmc: Got CD GPIO
> [    8.801855][  T130] buck1: Restricting voltage, 1050000-950000uV
> [    8.806411][  T129] buck1: Restricting voltage, 1050000-950000uV
> [    8.813413][  T130] buck1: Restricting voltage, 1050000-950000uV
> [    8.818261][  T130] cpu cpu4: _set_opp_voltage: failed to set
> voltage (1050000 1050000 1050000 mV): -22
> [    8.818307][  T129] buck1: Restricting voltage, 1050000-950000uV
> [    8.827239][  T129] cpu cpu0: _set_opp_voltage: failed to set
> voltage (1050000 1050000 1050000 mV): -22
> [    8.833161][  T130] cpu cpu4: Failed to set regulator voltages: -22
> [    8.842546][  T129] cpu cpu0: Failed to set regulator voltages: -22
> [    8.848941][  T130] cpufreq: __target_index: Failed to change cpu
> frequency: -22
> [    8.855273][  T129] cpufreq: __target_index: Failed to change cpu
> frequency: -22
> [    8.893720][  T129] buck1: Restricting voltage, 1050000-950000uV
> [    8.904437][  T129] buck1: Restricting voltage, 1050000-950000uV
> [    8.908515][  T129] cpu cpu0: _set_opp_voltage: failed to set
> voltage (1050000 1050000 1050000 mV): -22
> [    8.918057][  T129] cpu cpu0: Failed to set regulator voltages: -22
> [    8.924402][  T129] cpufreq: __target_index: Failed to change cpu
> frequency: -22
> [    8.945668][   T74] mmc1: SDHCI controller on d4280000.mmc
> [d4280000.mmc] using ADMA
> [    8.976207][  T130] buck1: Restricting voltage, 1050000-950000uV
> [    8.980156][  T130] buck1: Restricting voltage, 1050000-950000uV
> [    8.986169][  T130] cpu cpu4: _set_opp_voltage: failed to set
> voltage (1050000 1050000 1050000 mV): -22
> [    8.995473][  T130] cpu cpu4: Failed to set regulator voltages: -22
> [    9.001603][  T130] cpufreq: __target_index: Failed to change cpu
> frequency: -22
> [    9.020028][  T130] buck1: Restricting voltage, 1050000-950000uV
> [    9.024051][  T129] buck1: Restricting voltage, 1050000-950000uV
> [    9.030122][  T130] buck1: Restricting voltage, 1050000-950000uV
> [    9.036004][  T130] cpu cpu4: _set_opp_voltage: failed to set
> voltage (1050000 1050000 1050000 mV): -22
> [    9.036059][  T129] buck1: Restricting voltage, 1050000-950000uV
> [    9.045003][  T130] cpu cpu4: Failed to set regulator voltages: -22
> [    9.045077][  T130] cpufreq: __target_index: Failed to change cpu
> frequency: -22
> [    9.058079][   T57] spacemit-k1-pcie ca800000.pcie: host bridge
> /soc/pcie-bus/pcie@ca800000 ranges:
> [    9.064716][  T129] cpu cpu0: _set_opp_voltage: failed to set
> voltage (1050000 1050000 1050000 mV): -22
> [    9.064745][  T130] buck1: Restricting voltage, 1050000-950000uV
> [    9.064825][  T129] cpu cpu0: Failed to set regulator voltages: -22
> [    9.064889][  T129] cpufreq: __target_index: Failed to change cpu
> frequency: -22
> [    9.065762][  T130] buck1: Restricting voltage, 1050000-950000uV
> [    9.069924][   T60] spacemit-k1-pcie ca400000.pcie: host bridge
> /soc/pcie-bus/pcie@ca400000 ranges:
> [    9.071122][   T60] spacemit-k1-pcie ca400000.pcie:       IO
> 0x009f002000..0x009f101fff -> 0x0000000000
> [    9.073304][   T60] spacemit-k1-pcie ca400000.pcie:      MEM
> 0x0090000000..0x009effffff -> 0x0090000000
> [    9.081407][   T74] at24 2-0050: 256 byte 24c02 EEPROM, read-only
> [    9.083047][  T130] cpu cpu4: _set_opp_voltage: failed to set
> voltage (1050000 1050000 1050000 mV): -22
> [    9.083509][  T129] buck1: Restricting voltage, 1050000-950000uV
> [    9.083614][  T129] buck1: Restricting voltage, 1050000-950000uV
> [    9.083686][  T129] cpu cpu0: _set_opp_voltage: failed to set
> voltage (1050000 1050000 1050000 mV): -22
> [    9.083845][  T129] cpu cpu0: Failed to set regulator voltages: -22
> [    9.083885][  T129] cpufreq: __target_index: Failed to change cpu
> frequency: -22
> [    9.089945][   T57] spacemit-k1-pcie ca800000.pcie:       IO
> 0x00b7002000..0x00b7101fff -> 0x0000000000
> [    9.092728][    T1] clk: Disabling unused clocks
> [    9.095269][  T130] cpu cpu4: Failed to set regulator voltages: -22
> [    9.096981][    T1] PM: genpd: Disabling unused power domains
> [    9.104949][   T57] spacemit-k1-pcie ca800000.pcie:      MEM
> 0x00a0000000..0x00afffffff -> 0x00a0000000
> [    9.107986][  T129] buck1: Restricting voltage, 1050000-950000uV
> [    9.108166][  T129] buck1: Restricting voltage, 1050000-950000uV
> [    9.108246][  T129] cpu cpu0: _set_opp_voltage: failed to set
> voltage (1050000 1050000 1050000 mV): -22
> [    9.108311][  T129] cpu cpu0: Failed to set regulator voltages: -22
> [    9.108356][  T129] cpufreq: __target_index: Failed to change cpu
> frequency: -22
> [    9.108582][  T130] cpufreq: __target_index: Failed to change cpu
> frequency: -22
> [    9.113366][  T130] buck1: Restricting voltage, 1050000-950000uV
> [    9.118144][   T57] spacemit-k1-pcie ca800000.pcie:      MEM
> 0x00b0000000..0x00b6ffffff -> 0x00b0000000
> [    9.130386][  T130] buck1: Restricting voltage, 1050000-950000uV
> [    9.196246][  T130] cpu cpu4: _set_opp_voltage: failed to set
> voltage (1050000 1050000 1050000 mV): -22
> [    9.202562][   T60] spacemit-k1-pcie ca400000.pcie: iATU: unroll T,
> 8 ob, 8 ib, align 4K, limit 4G
> [    9.206998][  T130] cpu cpu4: Failed to set regulator voltages: -22
> [    9.257180][  T130] cpufreq: __target_index: Failed to change cpu
> frequency: -22
>
> After reviewing the Banana Pi F3 schematics, I confirmed that Buck1 and B=
uck2
> Both supply the CORE_0V9 with 0.9V=C2=B11% rail. To resolve the restricti=
on errors,
> I expanded the voltage range in the DTS to 500,000=E2=80=93950,000 =C2=B5=
V.
>
> Additionally, I updated the DTS to map the second CPU cluster (cores 4=E2=
=80=937)
> to Buck2 to better align with the hardware's power distribution.
>
> [1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/vie=
w
> (page 4)
>
> Can you share your thoughts on the changes below?
> $ git diff
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 7e300cca50d8..be53645ba0c6 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -102,19 +102,19 @@ &cpu_3 {
>  };
>
>  &cpu_4 {
> -       cpu-supply =3D <&buck1_3v45>;
> +       cpu-supply =3D <&buck2_3v45>;
>  };
>
>  &cpu_5 {
> -       cpu-supply =3D <&buck1_3v45>;
> +       cpu-supply =3D <&buck2_3v45>;
>  };
>
>  &cpu_6 {
> -       cpu-supply =3D <&buck1_3v45>;
> +       cpu-supply =3D <&buck2_3v45>;
>  };
>
>  &cpu_7 {
> -       cpu-supply =3D <&buck1_3v45>;
> +       cpu-supply =3D <&buck2_3v45>;
>  };
>
>  &emmc {
> @@ -234,14 +234,14 @@ pmic@41 {
>                 regulators {
>                         buck1_3v45: buck1 {
>                                 regulator-min-microvolt =3D <500000>;
> -                               regulator-max-microvolt =3D <3450000>;
> +                               regulator-max-microvolt =3D <950000>;
>                                 regulator-ramp-delay =3D <5000>;
>                                 regulator-always-on;
>                         };
>
> -                       buck2 {
> +                       buck2_3v45: buck2 {
>                                 regulator-min-microvolt =3D <500000>;
> -                               regulator-max-microvolt =3D <3450000>;
> +                               regulator-max-microvolt =3D <950000>;
>                                 regulator-ramp-delay =3D <5000>;
>                                 regulator-always-on;
>                         };
> > --
> > Best regards,
> > Shuwei Wu
>

I also made some modifications to the k1-opp.dtsi to fix the warning,
add over clock to 18000

[    8.712035][   T80] core: _opp_supported_by_regulators: OPP minuV:
1050000 maxuV: 1050000, not supported by regulator
[    8.720556][   T80] cpu cpu0: _opp_add: OPP not supported by
regulators (1600000000)
[    8.752494][   T80] core: _opp_supported_by_regulators: OPP minuV:
1050000 maxuV: 1050000, not supported by regulator
[    8.760906][   T80] cpu cpu4: _opp_add: OPP not supported by
regulators (1600000000)
[    8.780195][   T80] cpufreq: cpufreq_policy_online: CPU0: Running
at unlisted initial frequency: 1600000 kHz, changing to: 1228800 kHz
[    8.809572][   T80] cpufreq: cpufreq_policy_online: CPU4: Running
at unlisted initial frequency: 1600000 kHz, changing to: 1228800 kHz

$ git diff .
diff --git a/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
index 768ae390686d..bec565947ba3 100644
--- a/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
@@ -31,7 +31,13 @@ opp-1228800000 {

                opp-1600000000 {
                        opp-hz =3D /bits/ 64 <1600000000>;
-                       opp-microvolt =3D <1050000>;
+                       opp-microvolt =3D <950000>;
+                       clock-latency-ns =3D <200000>;
+               };
+
+               opp-1800000000 {
+                       opp-hz =3D /bits/ 64 <1800000000>;
+                       opp-microvolt =3D <950000>;
                        clock-latency-ns =3D <200000>;
                };
        };
@@ -66,7 +72,13 @@ opp-1228800000 {

                opp-1600000000 {
                        opp-hz =3D /bits/ 64 <1600000000>;
-                       opp-microvolt =3D <1050000>;
+                       opp-microvolt =3D <950000>;
+                       clock-latency-ns =3D <200000>;
+               };
+
+               opp-1800000000 {
+                       opp-hz =3D /bits/ 64 <1800000000>;
+                       opp-microvolt =3D <950000>;
                        clock-latency-ns =3D <200000>;
                };
        };

> Thanks
> -Anand

Thanks
-Anand
