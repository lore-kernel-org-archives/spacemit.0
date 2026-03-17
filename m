Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE90A386457
	for <spacemit@lists.linux.dev>; Tue, 17 Mar 2026 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773779074; cv=none; b=cY/9OEop6udfLWgyqmj0/flbOljRoPDa/7phWEPnnPp5uXiGgF4EZlwK3zbsA1uZpP1q1TEtHgV4gyIigLG4JspFOv56qmMb6ZdksOevOpeAY95ElxstPm5H2RksBE1yJc1EehbhsY4EEza0jO82ja/YxmIW5V7EAO5d9vcEQXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773779074; c=relaxed/simple;
	bh=/pSmMN7yBxcw33FZy6ItYc1Bekt1gKAsnKnNQIrvxNA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKdkfHJNDbgf6p9LY0boew1aVtt2BNIecCioawRXSd6DGWQGWVRnT6aohrupYdGpF+uS+spec7zcrRtiqcmZwoCQ1Etjp/bstg1uaRXyTPUq5JTqvAbbXUYABqVmPK7n6sQ3nmgeqiG8DJNJQLxp39L1HKUv8N05eFwX77YDAQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=A2joOL4t; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="A2joOL4t"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50697d6a69cso34770221cf.2
        for <spacemit@lists.linux.dev>; Tue, 17 Mar 2026 13:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773779072; x=1774383872; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mH049RaW0O4+GDFr4LRnFBkAFDmCy+4RM4isbdlqWYE=;
        b=A2joOL4t3gxMtbUHUtMUHvV02dMBqylnICMCJNzz6ENQ4ocsd0Mzj15cjzSTCBdUgP
         SUuHqUBt8InEIugXypMx6qf6GeiIr+AQszvzVfm3RWh1STuAGHteRv7aNy7IJvH4xZvG
         mLgWHnXOD8Jhq+ljYn4cw9bc7/AH0nbrrXNpJ/ps2uicNPZJd74YHhetzZP5fKH1NpIB
         1FawdchtmJB9FdNRjPiiBUlIdpuYjgn3ZLN95qvY/+xqhwPRAXTRPba8N4LMe2z1ERi+
         NDlZS3EiiJH32N08d00onIJtQP1ou8cLJ6R2NVfuUgxdtfCZiL+WV4HIelHmUsehi7wb
         CHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779072; x=1774383872;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mH049RaW0O4+GDFr4LRnFBkAFDmCy+4RM4isbdlqWYE=;
        b=oD3NOYXyZ1fm5dSET5co/95wKcG07uEiJXmROWxydOTdivAkF64F3wnqw0pHQZBHkY
         C8WgE9kdk/FmSB5JoKgdzbvliIvGcz8rR5PdbG28aWtru0Bc7iHGzFCpxBV3QnEsPSwj
         4VEOG27fQZnFFiG3jkDQmM5S6iKkH/mxIYrl7G4F6j+orWYM8MZzcL35XYlV0JXtobG4
         NV9rFF2QOP4z6IqbT5MCbjmOnhZL/SU27/+MmW3eAePn2aYjQx/8mA+nMoRtDJ7rWYnk
         IR5aKKkJ1Gy0YvXW7BJBoZgWt1l0s2jvIXzs7p6235iZD5dRLO+uUIRNPUxyUmSfRirL
         tckA==
X-Forwarded-Encrypted: i=1; AJvYcCWbPB37+rzuAelz3EDKLAje/dMEPLbVu50OG5LqoRH1s94b8/Vjl7LPLGmtyxBhwcRfdbm489Ncqg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvY+mTyxL5SPWTR5Bn+dki8Zghh83wBzFjz71n0pwjJH8GNjrw
	gRg3hlJX5rjFhxJGoSZR/jKPdp94pW1VXZsbzU6pi9MSOEy+04yGYSNpmDdNGZvw3io=
X-Gm-Gg: ATEYQzwp4GjS4dNjZvZSKY2uFH83RuKevcHn6yj96UpP3v6jyA6V6ePgCf0bjBG6kcT
	YoMreIdxUoEHkc3fL7ij4HDd/OIFOLzTAMNnoHWuyplCy3fI8qdnsT/NktykUZsxg/UtLbLrv3V
	or2ce4xvOfWl06YZdRRdCtxWvC9BNfS0YLmQFaEWboFFTKGPDdbsUuBssuGSE8RukybnJW9IIXi
	TXnBvIRSoNs6XFLgiOcBa7gqiK5+zvucaqFuBZw4aXh7SuVAsUBUaseKzVKbdygYLN24/zeXoHM
	DunJg306dD84pMJZf+k12ghy3fPn3VZ3cMYZQUscot9m0e+M5gu6av+xoAMGVwo9FTSlPj5PN2n
	zt9l4zMxa1l4yUo/sbWn1a8eSA08XViAsh69nViDjLOMrWAIX8ptc9OiqF68Qh7cRsJsYH7LmHb
	huW8F5YM4sUpkmpN29UXaBZMkrpW0QHYNam4SL07PlKg5RduPpi0DY0BcnC+7ZSf1bexu4OCusy
	1h4
X-Received: by 2002:a05:622a:41:b0:509:372e:35f5 with SMTP id d75a77b69052e-50b14887949mr8987231cf.55.1773779071676;
        Tue, 17 Mar 2026 13:24:31 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:4c82:63a9:39e9:5c17? ([2001:1970:3847:e000:4c82:63a9:39e9:5c17])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50b135b7e50sm6479901cf.22.2026.03.17.13.24.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 13:24:31 -0700 (PDT)
Message-ID: <6635a48f-e7b6-4f5d-8285-cb1149754cd1@baylibre.com>
Date: Tue, 17 Mar 2026 16:24:29 -0400
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC
 and power infrastructure
To: Iker Pedrosa <ikerpedrosam@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 Anand Moon <linux.amoon@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
 <20260316-orangepi-sd-card-uhs-v3-5-aefd3b7832df@gmail.com>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-5-aefd3b7832df@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 2026-03-16 10:03, Iker Pedrosa wrote:
> Add Spacemit P1 PMIC configuration and board power infrastructure for
> voltage regulation support.
>
> - Add board power regulators (12V input, 4V rail)
> - Enable I2C8 for PMIC communication
> - Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
> - Set up regulator constraints for SD card operation
>
> Tested-by: Anand Moon <linux.amoon@gmail.com>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..f1533c99881dbf38e16cff5e91e33253cfa7a56d 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -19,6 +19,25 @@ aliases {
>   		ethernet1 = &eth1;
>   	};
>   
> +	reg_dc_in: dc-in-12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_12v";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};

Hi,

This still shows 12V instead of the 5V connector listed in the board's spec.

I was able to test it without issue, but this should be fixed up.

> +
> +	reg_vcc_4v: vcc-4v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_4v";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&reg_dc_in>;
> +	};
> +
>   	chosen {
>   		stdout-path = "serial0";
>   	};
> @@ -92,3 +111,32 @@ &uart0 {
>   	pinctrl-0 = <&uart0_2_cfg>;
>   	status = "okay";
>   };
> +
> +&i2c8 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c8_cfg>;
> +	status = "okay";
> +
> +	pmic@41 {
> +		compatible = "spacemit,p1";
> +		reg = <0x41>;
> +		interrupts = <64>;
> +		vin-supply = <&reg_vcc_4v>;
> +
> +		regulators {
> +			buck4: buck4 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			aldo1: aldo1 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
>
