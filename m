Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E22D3E6DFF
	for <spacemit@lists.linux.dev>; Tue, 14 Apr 2026 13:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776173136; cv=pass; b=ofu373nHfJP50sZd7rG7t/TFsljGQqQ7G8k+qC1OuIgvFS3VFaffIbFAswFB3ZUHEsBPYf6yxpj+xU4IJQRa6HuduvfFFP6AeZP8y2qDefGNPCTg1BfgVvB9C2nMJQQSQctqwUcMDfZ9puWKmPm8L6zq3CUHYHpgf9WpFgWakbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776173136; c=relaxed/simple;
	bh=dmToRAa8rVmFxITbHNAQ7orPAttrnubK2XAvnPFoPcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o/4sSDuoVyjeUddC7O453FKuvLr2z/LCuMGK5uEkLBJDLUYTA25a1TL4PbkTshwLLeF7uGAsc43XJbsKPA1f/t3AcdKbFYpSPVbEwPTDBqaarMC1ZO3MPClxnQ7DV76bXysaUc2uZbRUu3rhvAQ+xhvwuLrme2jrYrdrGjoslDc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PH2lb2V2; arc=pass smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PH2lb2V2"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b9c6f1d1282so745429866b.3
        for <spacemit@lists.linux.dev>; Tue, 14 Apr 2026 06:25:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776173133; cv=none;
        d=google.com; s=arc-20240605;
        b=ABSifglfcHdmCUGmHQbOjou15xjAaUkyRRWDZvx6ma5wYgKgIa+BVaJhes3B/7july
         FfIpms8fwskGGyjQM2jpx7IjZ3feD2msspz6L9Ko9IOzFLpSKqmLJNAY/8XSF308AE/N
         FReAEIA5jxWMw1fptzA4PkTPxeOyBqU2IzxQ800A5oSC5L0ZC+HaRU6DR44e/QH8eZH0
         INAgyxIW+kilaV3cEoEXT/E1EEimoQmPuOG/aXorBVD3HCs9ScDTSoIroyhX588KMqgF
         0FETf/Z/lm1kc1dz9KVTga5AqAdY+/n3gdgziML2InOm1xjuEG/wMF8ViCm2bdFny6fM
         2kTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1rwaCRc2r8z5iPqTUdHmuFvHmmiQ+YCHzv+doVAKPkg=;
        fh=6R8QT1IvTQ8ST/QvNkoRXxM475GAMGGN5hIQ5STng98=;
        b=XLpbvMV/NEG9ePz5ZcnUYVBDKWaI/1aVx90oOpW2CDd6MazRMDhZkC0DsHFZR5cFIM
         jme7r4fC1pqIGGUHtj8/QJoOdbs6piQAhmgPlj0cQ/N0TDDDm8iVM1Px6fXZDlEKzcN6
         JdJDaBIdRpPZKIUmRL6SIR9Sa2wJ7b1fIZakdUpkkY0ZRWeGL7Ao78UfTymo6sEEbxPV
         gMC8Xyop3nAaPR9vR4cYF0Y70yr5NpNIyjR61Q9zutGh1D+Gli7iE81onnibbfrglbeO
         eScCErv4oXY5ziS5rHDTwbvFRrtY0r9M0yx+V034v0fvIk+EeXh/rEBs0yj9Q1D6+IRm
         3QBQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776173133; x=1776777933; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1rwaCRc2r8z5iPqTUdHmuFvHmmiQ+YCHzv+doVAKPkg=;
        b=PH2lb2V2VX2HqKQc17lFLj/+XvXeLGNFnvmp2HUqFXF2SLvfGmiUKyNCPnek62+rzf
         nbn0JSb7TUbEq0KDJec+dQbe/+ZMhBbWtWqqMKYbCRCaDvP2kGFiV/w+KTePaZs7i53U
         vgJn5RUXw6XLU0yPtsXEXuP4roUYvSrlsLAPsmANqb++uQVuxTh+xvo2rnD2yhBqrmFn
         7A11Eo/qz6tk21fL5wW70wHhMDv/dj+GbW1dcmcUxb4BEVzVf1ogR1Du1iifAdcRHQ9a
         oMvltl83RK0egCJyeLR1obiCGL+qZpyfbtOo02mhTckKJrhTbFpJJ1ZWGz04pcHWPW6z
         SDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776173133; x=1776777933;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1rwaCRc2r8z5iPqTUdHmuFvHmmiQ+YCHzv+doVAKPkg=;
        b=RJ33usE03SJXWv0PXyt/4h4jC+cW8CEKZR745KaeqXUh9phRK4zXToGLz40yFZsJNV
         beNgQupvhvUPt7k8dGUBUW7E14fSf4ThVWXStwc3HEPl65l//lNOrSxFXZfj8abAIwmb
         L0VTaSYL/jB0UklARzVkVpuNWmWB30zTDiItcTkGUBG22yWFe1YgsTyO/BuapX3p6wP9
         SFObEECaq15852s5PoppBH4m2tfAgaxwKPq80nQZIf1W0OOxtrqQuG9hiTIp2VCx2B9m
         yGaW1N+cDq3Emvk2KdqR7Xx9VqPMI7lyn7i1wNYlQ98kdcAot2XFxaYTH3TXlZBsnlD1
         d7Kg==
X-Forwarded-Encrypted: i=1; AFNElJ+XpSmCg9RQi1GKBeub+oXAqruF7MNGydqmWTgzN0sKCeXZexIdpDMoCYgUhh3r9UQqpT8fSK1jBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNrAkqu/+uA2QcB6/OsBnYdXGC2wljw0DEtIm+ck3tAdNbYPAq
	YH99d40emVl1a33hlPqQXjESfS0kTZavYFRzh2NAckuv3XuSD3P7eLBlkocXVtDEc3UDzDV4Hd4
	8DtzkQzJhdErU9oNFiQxmILeu2XzbEZ0=
X-Gm-Gg: AeBDiesQG0239CLiRDkW6CYlFaAYKccstRDN43uL1DK1TB78Lnit40ENGl7LSqM0Y8O
	MGi93dKJjGORwUUPiHgIJdcBEWyeCrIDJpzfD9tvEHGgoq052ao1QGXobbRhFTR3VEOGZfkJa2E
	dU+XweLu/77w0cuMmz8lDKZN39CNNZNKhMGpeglRcvFS9DjMQxIVg1JOKsGRbJmsSNlgW29Jc/7
	N/ox7Hwf6wsXR3ItWTphVt0jhIfjxwrlfE74SWu2fGSYHLxH1fpRWwEdEGYtZfCVxLdHaXwiu2j
	IUa9fA==
X-Received: by 2002:a17:906:ba8b:b0:b98:b08:7442 with SMTP id
 a640c23a62f3a-b9d7277caf6mr927238066b.7.1776173132486; Tue, 14 Apr 2026
 06:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410-shadow-deps-v2-0-4e16b8c0f60e@mailbox.org> <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org>
In-Reply-To: <20260410-shadow-deps-v2-2-4e16b8c0f60e@mailbox.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Tue, 14 Apr 2026 18:55:16 +0530
X-Gm-Features: AQROBzA45N5tX_gxF8wNR9dEOurmKJqRG5G4HXCsGJ5ETbsePSdurO7YbSqgcRs
Message-ID: <CANAwSgSNHO3MNewNzpYbhuj4K3NTdfzDC9KPoUHbFH97P4M_UQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shuwei,

On Fri, 10 Apr 2026 at 13:30, Shuwei Wu <shuwei.wu@mailbox.org> wrote:
>
> Add Operating Performance Points (OPP) tables and CPU clock properties
> for the two clusters in the SpacemiT K1 SoC.
>
> Also assign the CPU power supply (cpu-supply) for the Banana Pi BPI-F3
> board to fully enable CPU DVFS.
>
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
>
> ---
> Changes in v2:
> - Add k1-opp.dtsi with OPP tables for both CPU clusters
> - Assign CPU supplies and include OPP table for Banana Pi BPI-F3
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
>  arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 ++++++++++++++++++++++++
>  arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
>  3 files changed, 147 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 444c3b1e6f44..3780593f610d 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -5,6 +5,7 @@
>
>  #include "k1.dtsi"
>  #include "k1-pinctrl.dtsi"
> +#include "k1-opp.dtsi"
>
>  / {
>         model = "Banana Pi BPI-F3";
> @@ -86,6 +87,38 @@ &combo_phy {
>         status = "okay";
>  };
>
> +&cpu_0 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_1 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_2 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_3 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_4 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_5 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_6 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_7 {
> +       cpu-supply = <&buck1_3v45>;
> +};
> +
>  &emmc {
>         bus-width = <8>;
>         mmc-hs400-1_8v;
> @@ -201,7 +234,7 @@ pmic@41 {
>                 dldoin2-supply = <&buck5>;
>
>                 regulators {
> -                       buck1 {
> +                       buck1_3v45: buck1 {
>                                 regulator-min-microvolt = <500000>;
>                                 regulator-max-microvolt = <3450000>;
>                                 regulator-ramp-delay = <5000>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-opp.dtsi b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
> new file mode 100644
> index 000000000000..768ae390686d
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/ {
> +       cluster0_opp_table: opp-table-cluster0 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-614400000 {
> +                       opp-hz = /bits/ 64 <614400000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-819000000 {
> +                       opp-hz = /bits/ 64 <819000000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1000000000 {
> +                       opp-hz = /bits/ 64 <1000000000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1228800000 {
> +                       opp-hz = /bits/ 64 <1228800000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1600000000 {
> +                       opp-hz = /bits/ 64 <1600000000>;
> +                       opp-microvolt = <1050000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +       };
> +
> +       cluster1_opp_table: opp-table-cluster1 {
> +               compatible = "operating-points-v2";
> +               opp-shared;
> +
> +               opp-614400000 {
> +                       opp-hz = /bits/ 64 <614400000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-819000000 {
> +                       opp-hz = /bits/ 64 <819000000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1000000000 {
> +                       opp-hz = /bits/ 64 <1000000000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1228800000 {
> +                       opp-hz = /bits/ 64 <1228800000>;
> +                       opp-microvolt = <950000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +
> +               opp-1600000000 {
> +                       opp-hz = /bits/ 64 <1600000000>;
> +                       opp-microvolt = <1050000>;
> +                       clock-latency-ns = <200000>;
> +               };
> +       };
> +};
> +
> +&cpu_0 {
> +       operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_1 {
> +       operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_2 {
> +       operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_3 {
> +       operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_4 {
> +       operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_5 {
> +       operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_6 {
> +       operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_7 {
> +       operating-points-v2 = <&cluster1_opp_table>;
> +};
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 529ec68e9c23..bdd109b81730 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -54,6 +54,7 @@ cpu_0: cpu@0 {
>                         compatible = "spacemit,x60", "riscv";
>                         device_type = "cpu";
>                         reg = <0>;
> +                       clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>                         riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>                         riscv,isa-base = "rv64i";
>                         riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -84,6 +85,7 @@ cpu_1: cpu@1 {
>                         compatible = "spacemit,x60", "riscv";
>                         device_type = "cpu";
>                         reg = <1>;
> +                       clocks = <&syscon_apmu CLK_CPU_C0_CORE>;

Based on the Spacemit kernel source, the k1-x_opp_table.dtsi file
defines several additional clocks for the Operating Performance Points
(OPP) table:

 clocks = <&ccu CLK_CPU_C0_ACE>, <&ccu CLK_CPU_C1_ACE>, <&ccu CLK_CPU_C0_TCM>,
                        <&ccu CLK_CCI550>, <&ccu CLK_PLL3>, <&ccu
CLK_CPU_C0_HI>, <&ccu CLK_CPU_C1_HI>;
                clock-names = "ace0","ace1","tcm","cci","pll3", "c0hi", "c1hi";

These hardware clocks are also explicitly registered in the APMU clock driver
via the k1_ccu_apmu_hws array, confirming their availability for frequency
and voltage scaling on the K1-X SoC.

static struct clk_hw *k1_ccu_apmu_hws[] = {
        [CLK_CCI550]            = &cci550_clk.common.hw,
        [CLK_CPU_C0_HI]         = &cpu_c0_hi_clk.common.hw,
        [CLK_CPU_C0_CORE]       = &cpu_c0_core_clk.common.hw,
        [CLK_CPU_C0_ACE]        = &cpu_c0_ace_clk.common.hw,
        [CLK_CPU_C0_TCM]        = &cpu_c0_tcm_clk.common.hw,
        [CLK_CPU_C1_HI]         = &cpu_c1_hi_clk.common.hw,
        [CLK_CPU_C1_CORE]       = &cpu_c1_core_clk.common.hw,
        [CLK_CPU_C1_ACE]        = &cpu_c1_ace_clk.common.hw,

Yes, it is possible to add these clocks for DVFS to work correctly,
provided they are managed by the appropriate driver and declared in
the Device Tree (DT).

Thanks
-Anand
