Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE33F27A477
	for <spacemit@lists.linux.dev>; Sun,  8 Mar 2026 17:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772992792; cv=none; b=eL/leLG1LPXSTPWGvkxwVwryUAiBEZClIKoLsUu38+X81C+K1Y8/8S8J4tePGJ8rCv0lTTShHoQejnBYoaWPlCLwJZ2PjbOOVGwbKZKxQ/obyI7QrPBStjviFVnsZtqQr5OowylJexZw/Tka2wM7OtCLylz0EmccA6kSMPgs8sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772992792; c=relaxed/simple;
	bh=2w00/5rikfHMrMWNlIDnWCYd2a3uo7SKCGFo4KzYTnU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ep3+A+/zuicO/TjDbmUSxz9YBPGTOkkW33BdgOZT8mJEYfVGeUUc3H69QxIWbgFQmdNAROuu9qwj1j6MZfoIRQwjQy7wX8cR14YXK0afvINCyFijAWxYTrnNzEe28JoOkn7SJLnepljPL7Tc1Ri8W3QMb8GFnlAYYnVlPRHWd+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com; spf=pass smtp.mailfrom=sifive.com; dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b=T67MizfW; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="T67MizfW"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-78fc4425b6bso107905837b3.1
        for <spacemit@lists.linux.dev>; Sun, 08 Mar 2026 10:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1772992790; x=1773597590; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TV+fid+6EASBoKc0dODxReLnENoxtwD9DEo9QwziAPo=;
        b=T67MizfW6mFPfud7aS6yWZYAg4rAStmtEKBNDcaDBPHSS2K8V4dCOSBJ7jH/giEFjl
         edW9jszlH+oCbKcmLg0ogDP3H7lwDh+gdTM2jD27E7okdfAvaadYU33CeEtc/MwCXbSx
         1k+PsVQYnJrLsUMf/33Kbp6PqnIapllBr/cWYtA3vN1DtAZbvEcdmIZBrEa14oLqax3R
         aTNigX32dU3ZNQ9PVl3rcTQMLIgCkdMtYvQln1n7TsPZc/liZP37y5fJZG/O1TwXDVA1
         uUv6F0OESThDr2FLcBS7aCSmniK1uAINw7+3uAYdfPYdkUgQZL0im4z80QCEA7Do/35g
         UvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772992790; x=1773597590;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TV+fid+6EASBoKc0dODxReLnENoxtwD9DEo9QwziAPo=;
        b=H1W7esKaxi2vy850fHJbZ029E2CmaULH4ZeFRVXE1b9xc1MvsfJGAqdv2oWuRaVcND
         BWnR0ylNeZ8bMOnWhs3iKS4OYUHNZ2YCXw0bj/WIsQh0rvpJM2hE98xKGFR/dTlOmRGO
         joKKmKDmRnnPX6K0xeg9zYNrRqrLb3pcrxcPU6q7UzY2rkG1Pyohguo0g4KUO7CPs9CR
         pryPgZQsVBug8s0HUIu1riJN3Sr4T7V2cP8So9lNz98fchDVHEsNw1kDBLXpM7Vkxg/i
         nc8UTiOUbDvIu+6oQv5bNFZ6tul74JBD5EMYWnze54QyX+f0++OiOYpiOc7Ele+uRH/f
         kkgw==
X-Forwarded-Encrypted: i=1; AJvYcCWhhNuvFIzNtv2Pu0sSAS+77lyCp8hxbVWNxlskozuxPGZooe72uu7caIqfGEBoZAFi+LPaHWDkIg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxg6MMFA4fsHHs0LELZuV0uJPjUOEHg/w/mmlPlhvmgLTPf0jnN
	IUwurbaVBPcSw8dKeVFoYFhiQsr/qOMVoEHE2QHQ6JLW2i9Wv62wBBFtDSwPx3ZYvc4=
X-Gm-Gg: ATEYQzzFRHy+A64CZxhhOma93OruMCHq/Zn8g7NUyigUxo053t4jYKGY+IdOA8+wT0i
	0oK1VYQNyIC/PvhneBe5tqtglpsoQAB7yQ8V42sC8BdRCxneqYSNyTH2MNTASYQbRH5RfLIBont
	e8BhC99VvtQ1tCCTS+hNyGDvxWkgTome/V2bemk1LF9Pt+VfHsO9HCPXeG5OTagDjy47JMaBTa2
	fyDrPtZDlzbY65O61eYlyWwVlaqB4HdnG42HnneKSNvs3UNr0Eo9Z/8rxJTz4qtRgETGZu68Ozu
	V9TKjNsspwRJPB5Kvx2RWR8NrFBXORfhDniX2pIkWdIFkzZdmARix/gcQ7oSAvmNd5zcJza7PTg
	iqaHsl3L44mGUhXJWcZaG1Rv2DNZSEL/EBXlTjpEGt8TEQqoN4KjsJh5AcUHLeehCzXQ6odaUtz
	rR3ZIubXOrtE7clzPnQpo7Hnue1h+nkfrWZyW6IW8xc2pHta9zPJk=
X-Received: by 2002:a05:690c:6b12:b0:797:ac4a:6ff8 with SMTP id 00721157ae682-798dd79737dmr77044737b3.61.1772992789901;
        Sun, 08 Mar 2026 10:59:49 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.33])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-798dec8b953sm34660587b3.6.2026.03.08.10.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Mar 2026 10:59:49 -0700 (PDT)
Message-ID: <610da0d3-1dc0-4f4f-afb4-869d3ed81321@sifive.com>
Date: Sun, 8 Mar 2026 12:59:48 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Yixun Lan <dlan@gentoo.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
References: <20260308-shadow-deps-v1-0-0ceb5c7c07eb@mailbox.org>
 <20260308-shadow-deps-v1-2-0ceb5c7c07eb@mailbox.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260308-shadow-deps-v1-2-0ceb5c7c07eb@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shuwei,

On 2026-03-07 11:17 PM, Shuwei Wu wrote:
> Add Operating Performance Points (OPP) tables and CPU clock properties
> for the two clusters in the SpacemiT K1 SoC.
> 
> Also assign the CPU power supply (cpu-supply) for the Banana Pi BPI-F3
> board to fully enable CPU DVFS.
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 34 +++++++++-
>  arch/riscv/boot/dts/spacemit/k1.dtsi            | 86 +++++++++++++++++++++++++
>  2 files changed, 119 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 444c3b1e6f44..b87bf9d51cb1 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -86,6 +86,38 @@ &combo_phy {
>  	status = "okay";
>  };
>  
> +&cpu_0 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_1 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_2 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_3 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_4 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_5 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_6 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
> +&cpu_7 {
> +	cpu-supply = <&buck1_3v45>;
> +};
> +
>  &emmc {
>  	bus-width = <8>;
>  	mmc-hs400-1_8v;
> @@ -201,7 +233,7 @@ pmic@41 {
>  		dldoin2-supply = <&buck5>;
>  
>  		regulators {
> -			buck1 {
> +			buck1_3v45: buck1 {
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3450000>;
>  				regulator-ramp-delay = <5000>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 529ec68e9c23..5c7bb5d85fc0 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -54,6 +54,8 @@ cpu_0: cpu@0 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <0>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
> +			operating-points-v2 = <&cluster0_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -84,6 +86,8 @@ cpu_1: cpu@1 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <1>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
> +			operating-points-v2 = <&cluster0_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -114,6 +118,8 @@ cpu_2: cpu@2 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <2>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
> +			operating-points-v2 = <&cluster0_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -144,6 +150,8 @@ cpu_3: cpu@3 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <3>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
> +			operating-points-v2 = <&cluster0_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -174,6 +182,8 @@ cpu_4: cpu@4 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <4>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
> +			operating-points-v2 = <&cluster1_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -204,6 +214,8 @@ cpu_5: cpu@5 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <5>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
> +			operating-points-v2 = <&cluster1_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -234,6 +246,8 @@ cpu_6: cpu@6 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <6>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
> +			operating-points-v2 = <&cluster1_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -264,6 +278,8 @@ cpu_7: cpu@7 {
>  			compatible = "spacemit,x60", "riscv";
>  			device_type = "cpu";
>  			reg = <7>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
> +			operating-points-v2 = <&cluster1_opp_table>;
>  			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>  			riscv,isa-base = "rv64i";
>  			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -339,6 +355,76 @@ osc_32k: clock-32k {
>  		};
>  	};
>  
> +	cluster0_opp_table: opp-table-cluster0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-614400000 {
> +			opp-hz = /bits/ 64 <614400000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-819000000 {
> +			opp-hz = /bits/ 64 <819000000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1228800000 {
> +			opp-hz = /bits/ 64 <1228800000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +	};
> +
> +	cluster1_opp_table: opp-table-cluster1 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-614400000 {
> +			opp-hz = /bits/ 64 <614400000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-819000000 {
> +			opp-hz = /bits/ 64 <819000000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1228800000 {
> +			opp-hz = /bits/ 64 <1228800000>;
> +			opp-microvolt = <950000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <1050000>;
> +			clock-latency-ns = <200000>;

What is the initial voltage set by firmware before Linux boots? If it is 1.05V,
this is fine, but if the default is 950mV, then you cannot enable the OPP table
in the SoC .dtsi file. Boards other than the BananaPi F3 are missing the
cpu-supply property, so they won't raise the CPU voltage before switching to the
higher frequency. The usual solution is to put the OPP table (or at least the
OPPs that require a higher voltage) in a separate .dtsi file, and only include
that file from boards that provide the cpu-supply.

Regards,
Samuel

