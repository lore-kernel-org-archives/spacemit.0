Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96883ED3B9
	for <spacemit@lists.linux.dev>; Fri, 26 Jun 2026 10:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782470220; cv=none; b=WSmm+Nw65Yac/vflFrcYWeKwUNFYxJyTu20N06nUcORcQs5c4DbeDda0/c8AEbOcu2MbZ7mksgzB6O9jNTsCP/y+JLfZOIc0WkFLZMhB8R1H33nRYFjvGIA9e0BMWYFuLkriU2u+enyDWHdjo9HZmWjOw1Ho/f+XLwCQbvmz52c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782470220; c=relaxed/simple;
	bh=UYLMSQIhe6qO0sm3exwD+uQX3V04ifUVR98mAMtFHoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EcziaKHR5DwPu4TIUzAt3aKer4bxkzGYXIpWwjCvWhPpOuQRjcEa4dOAyXTXwAAaAxRB0/Y1q67I+1lS9t9RS+RtDcokz5o9dpP3/PID30E+J4vNU9/4cMAUWLogMfFAJy3Pm836Bwh7B9RG1vISypDSXlzCfe+y2VvMgS1Zyeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dp36pSUm; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dp36pSUm"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4629051c9d1so403917f8f.2
        for <spacemit@lists.linux.dev>; Fri, 26 Jun 2026 03:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782470212; x=1783075012; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D+LOxUqboNwspW3Z1iwsJeIpREU5uApJLby1JgVSadY=;
        b=dp36pSUmVD+MCEP7XAGRkqv2Xnku81opn10VDCYNVuCHhvVecnZMsUEPfM85AbpoNR
         9vRE6BOkW7bkXJI0O6NXADJyGj/baishq+z2hKdBwuLtVIeeyEKY93eBXwSbSkfvCTfK
         9uBFczgJrfSepVcruPWybdk3cxylv1wqoJaRq0gNB+seXS7CwU+NKgEgFKMrGFhaxiGC
         rYn06Qrf0hoJjrpqZYlD+0EYPtGsB7LKmfZOL/FmX3mxDeJHIEGgBe22Jd5+yE+YwY5r
         6yJdl3XAH3ka/ehhwhPQ6A7yPbg9OojRBVZ97TWjdY2hColVlVmtKYZkbjS1WzaL+w6M
         wJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782470212; x=1783075012;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D+LOxUqboNwspW3Z1iwsJeIpREU5uApJLby1JgVSadY=;
        b=EH+PF1ur157OTvvH5RJvXOzn2vLO8JB2m2y6OmhZHQMLBNK5cKCnF8vnDZP/hXyJUO
         NGep+jBuS4aZD3S1AZ/ukAt9xUR+F0r6EJVrMMpKg7gbJUYHlB8fKrPdGSZpdTVElddf
         BJ5UqEFGKlAbef6gvOnrE+8r4y/gIUjII7yF1XEESBZgXACV3FharP6lOQttjbOYnSqw
         +tD3l7UvoblMyjjIP713tu8TnPIhQ30+bhWUGATyqgFBJKpTEp/z0ZZO9hFl4DMsv8J6
         5W7GUPYhMV00B55GFLjhbDgJCi58HxzBPWnQlGXBDgCkwT2RbroS9EgcfhODfIvS3Qvz
         gPLA==
X-Forwarded-Encrypted: i=1; AHgh+RoawPbeVmRZttszLj8xyTj2F1nYti9K0lmAbqJ5IruSHiI3+GKW/x+LSz6o2FTqSzPhNa0M8gFRYA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy177Wvoc0e5HGIGuM4jwap3EOIYUNPkhfqe2dQYA+e+IU+tn4p
	mkk1cBavDEykc1JdMeo5b8+hYkVyVT4Gop2FgOHfu2HggQ8ngrWCa1bO
X-Gm-Gg: AfdE7cltXPsWG9W07Ljvtc2D739KMHnj5i9JjEyOOCYrxf/LanT3o2NGAO+Rm8aXKJu
	n/wa2KHiVhVQa/TdTKOu0RC84JSWMicgEsBRuBUecSkZo4rsIr5hnI+GPKqun7Et4BRdlYDoa9G
	2SJL5oSLdt8FAdnkMvGuGEMBNfPqY8hC1+ANGvFUl6dUE0hpp/U33w73JbnBUDm6f0wD6pzffFF
	Nv/YODb23VhOlXoyHm/XDUpk/eZybk1SHEdLFeBF/j0d1Tev1FWdsDROoY/qjHJgpckVNR+PfA+
	yZT22SnNGGDPUW/YUyZr5J6IR2pAGXt7f1ZTtoMKWo+gDwj7ewOy4fK8MLm+zZkz0z4CrtiZ4EX
	TDkZOvCU8swCCgGikjSyy5v2dtmWRl70ugXNzB53Hz5LqqJeACA4N6/BReMaFUIPz0NPWeotYNX
	n0gwmc+7qrIea4FSDQ+QCcarh159fGyiF3YQR9vso9T/48HZhHSIGa4Vg=
X-Received: by 2002:a5d:6f11:0:b0:46e:341b:45dd with SMTP id ffacd0b85a97d-46e341b47c7mr8297132f8f.26.1782470211515;
        Fri, 26 Jun 2026 03:36:51 -0700 (PDT)
Received: from [192.168.0.40] (a89-182-137-217.net-htp.de. [89.182.137.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46dd5f9da4fsm15043736f8f.23.2026.06.26.03.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 03:36:50 -0700 (PDT)
Message-ID: <2a69d701-741b-4d65-bdbe-226610bf53b5@gmail.com>
Date: Fri, 26 Jun 2026 12:36:48 +0200
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] riscv: dts: spacemit: Add cpu scaling for K1 SoC
To: Shuwei Wu <shuwei.wu@mailbox.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260626-shadow-deps-v4-0-bba9831f2f1d@mailbox.org>
 <20260626-shadow-deps-v4-2-bba9831f2f1d@mailbox.org>
From: Andre Heider <a.heider@gmail.com>
Content-Language: de-DE
In-Reply-To: <20260626-shadow-deps-v4-2-bba9831f2f1d@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.06.26 10:10 AM, Shuwei Wu wrote:
> Add CPU clock properties and OPP tables for the two CPU clusters in the
> SpacemiT K1 SoC. The OPP entries use voltage ranges because the CPU
> supply is shared by both clusters.
> 
> Enable CPU DVFS on Banana Pi BPI-F3 by including the OPP tables and
> wiring the CPU nodes to the CPU regulator supply.
> 
> Signed-off-by: Shuwei Wu <shuwei.wu@mailbox.org>

With the musepi-pro dts enablement patch [0] on top, this is
Tested-by: Andre Heider <a.heider@gmail.com> # k1-musepi-pro

Works as advertised, I get two policies, matching the clusters:
$ cat /sys/devices/system/cpu/cpufreq/policy0/related_cpus
0 1 2 3
$ cat /sys/devices/system/cpu/cpufreq/policy4/related_cpus
4 5 6 7

Some time after boot:
$ cat /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state
614400 31124
819000 185
1000000 158
1228800 341
1600000 1148
$ cat /sys/devices/system/cpu/cpufreq/policy4/stats/time_in_state
614400 29232
819000 198
1000000 212
1228800 443
1600000 3428

Creating one single-threaded load increases max freq time_in_state in one policy (4 here):
$ yes > /dev/null &
(...after some time)
$ cat /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state
614400 45244
819000 187
1000000 169
1228800 345
1600000 1148
$ cat /sys/devices/system/cpu/cpufreq/policy4/stats/time_in_state
614400 38794
819000 201
1000000 226
1228800 450
1600000 7580

Creating load for all 8 cores in both:
$ yes > /dev/null &
$ yes > /dev/null &
$ yes > /dev/null &
$ yes > /dev/null &
$ yes > /dev/null &
$ yes > /dev/null &
$ yes > /dev/null &
$ yes > /dev/null &

$ cat /sys/devices/system/cpu/cpufreq/policy0/stats/time_in_state
614400 51371
819000 190
1000000 171
1228800 352
1600000 4391
$ cat /sys/devices/system/cpu/cpufreq/policy4/stats/time_in_state
614400 44121
819000 203
1000000 244
1228800 452
1600000 11812

Thanks!
Andre

[0] https://lore.kernel.org/all/20260614122812.2287506-1-a.heider@gmail.com/

> ---
> Changes in v4:
> - Use separate OPP tables for the two CPU clock clusters
> - Use voltage ranges for the shared CPU supply
> 
> Changes in v3:
> - Use one shared CPU OPP table for all CPUs
> 
> Changes in v2:
> - Add k1-opp.dtsi with OPP tables for both CPU clusters
> - Assign CPU supplies and include OPP table for Banana Pi BPI-F3
> ---
> ---
>   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts |  35 +++++++-
>   arch/riscv/boot/dts/spacemit/k1-opp.dtsi        | 105 ++++++++++++++++++++++++
>   arch/riscv/boot/dts/spacemit/k1.dtsi            |   8 ++
>   3 files changed, 147 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 444c3b1e6f44..487179f7b9b9 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -4,6 +4,7 @@
>    */
>   
>   #include "k1.dtsi"
> +#include "k1-opp.dtsi"
>   #include "k1-pinctrl.dtsi"
>   
>   / {
> @@ -86,6 +87,38 @@ &combo_phy {
>   	status = "okay";
>   };
>   
> +&cpu_0 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_1 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_2 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_3 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_4 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_5 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_6 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
> +&cpu_7 {
> +	cpu-supply = <&buck1_0v9>;
> +};
> +
>   &emmc {
>   	bus-width = <8>;
>   	mmc-hs400-1_8v;
> @@ -201,7 +234,7 @@ pmic@41 {
>   		dldoin2-supply = <&buck5>;
>   
>   		regulators {
> -			buck1 {
> +			buck1_0v9: buck1 {
>   				regulator-min-microvolt = <500000>;
>   				regulator-max-microvolt = <3450000>;
>   				regulator-ramp-delay = <5000>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-opp.dtsi b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
> new file mode 100644
> index 000000000000..4cebfcd87485
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-opp.dtsi
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/ {
> +	cluster0_opp_table: opp-table-cluster0 {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-614400000 {
> +			opp-hz = /bits/ 64 <614400000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-819000000 {
> +			opp-hz = /bits/ 64 <819000000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1228800000 {
> +			opp-hz = /bits/ 64 <1228800000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <1050000 1050000 1050000>;
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
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-819000000 {
> +			opp-hz = /bits/ 64 <819000000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1228800000 {
> +			opp-hz = /bits/ 64 <1228800000>;
> +			opp-microvolt = <950000 950000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +
> +		opp-1600000000 {
> +			opp-hz = /bits/ 64 <1600000000>;
> +			opp-microvolt = <1050000 1050000 1050000>;
> +			clock-latency-ns = <200000>;
> +		};
> +	};
> +};
> +
> +&cpu_0 {
> +	operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_1 {
> +	operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_2 {
> +	operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_3 {
> +	operating-points-v2 = <&cluster0_opp_table>;
> +};
> +
> +&cpu_4 {
> +	operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_5 {
> +	operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_6 {
> +	operating-points-v2 = <&cluster1_opp_table>;
> +};
> +
> +&cpu_7 {
> +	operating-points-v2 = <&cluster1_opp_table>;
> +};
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 529ec68e9c23..bdd109b81730 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -54,6 +54,7 @@ cpu_0: cpu@0 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <0>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -84,6 +85,7 @@ cpu_1: cpu@1 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <1>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -114,6 +116,7 @@ cpu_2: cpu@2 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <2>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -144,6 +147,7 @@ cpu_3: cpu@3 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <3>;
> +			clocks = <&syscon_apmu CLK_CPU_C0_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -174,6 +178,7 @@ cpu_4: cpu@4 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <4>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -204,6 +209,7 @@ cpu_5: cpu@5 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <5>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -234,6 +240,7 @@ cpu_6: cpu@6 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <6>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> @@ -264,6 +271,7 @@ cpu_7: cpu@7 {
>   			compatible = "spacemit,x60", "riscv";
>   			device_type = "cpu";
>   			reg = <7>;
> +			clocks = <&syscon_apmu CLK_CPU_C1_CORE>;
>   			riscv,isa = "rv64imafdcbv_zicbom_zicbop_zicboz_zicntr_zicond_zicsr_zifencei_zihintpause_zihpm_zfh_zba_zbb_zbc_zbs_zkt_zvfh_zvkt_sscofpmf_sstc_svinval_svnapot_svpbmt";
>   			riscv,isa-base = "rv64i";
>   			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "b", "v", "zicbom",
> 

