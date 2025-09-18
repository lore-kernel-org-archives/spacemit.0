Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 570B021ABC9
	for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758203489; cv=none; b=M1xifA9+9VEF37/f+5KwAwSbgRPfFqjCbwTRNl3PY0f081tXq0u/CtAvL9zaVYCqXZQUX8LJ8nUjeOPi6v7iNwoI2FL5uQYFuCuI8voI52HnHm83q9JEghQKWhMvGO7A7xQa71OEDG48CgYyYuYXn/gMvq6Bol13BZHeqR0USUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758203489; c=relaxed/simple;
	bh=Fvc5zCFgxQNXp10SMLlcISau9kDno376afrlmJIocKw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDzNRJEyQ/O52PU0FRyTHUXBOxdD4lx+q6H2BaEkVeCnsH2AEVpPMNqxcBM0Ir74MpbGD/biDXt7ke86MsRPbAlV8kUh5o9xdtzbo9fgKPpZ4IvRZg4bmZjMmQsbXDv0YMtUbfoTWRdZHV9TomdFlPjEwvmQkJvYoPoJTNtFHBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=HMpy+b1W; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="HMpy+b1W"
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-8935b53bb14so36652539f.0
        for <spacemit@lists.linux.dev>; Thu, 18 Sep 2025 06:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758203486; x=1758808286; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vM4y9eRdzyomlugDECoWGADI8eAEH9U89ng3nFm0pbU=;
        b=HMpy+b1WJViaQI0wafFO8TuWF+Lpoc9PqH3nxJL5sFo9JlBktmT+MbZGdl+ocACTnx
         81Cusc0awLl36gqM1sNlt8tlxUrKZXD8ctKfnieJXM05NIUGgSmsXbpfoARTEEdCCXrt
         bfEUlBiwNT1K3GY9qT6jR9HjIMVhMSd7/+qWgR6LYqI0xfWZVurF8ZAELu83EpHVF2Jk
         aU+cfb02LSw/uc/fuJsKLeHB5PE/SX64ixFUoTvopmSjpGf+KVDB4u1KI+nf1cd8TSn4
         qBgjJx5zGqS96SiUb42iblBJlbpJyTFuH5aYPpyLqiKm4hAE61eo429uTRJlCYUx0Vgy
         knZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758203486; x=1758808286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vM4y9eRdzyomlugDECoWGADI8eAEH9U89ng3nFm0pbU=;
        b=vYwwBA8g/VgHpMxSn6bd+giP7vfOexhpHvXg2qDDe+dPrqXubC+sEANyCcYfTbOrXI
         iUZz70JNGKtYmQWEkDq2cvdKlV4fG6q0fF+2YluQklSsJso+A+tFq2sq8g01iFuDWiBq
         +DP63/i87Nt5v0KX3pAt6jGbh/8egrH/YHCcXONBL17X7ZISgVQ+0gztvcqhaMKCHjOu
         eugAZZJ9u6LCCJq08XNcQMX2tnAWp8E+24QTHgwE7Ta0Ong8xog4iHsWQ512xHRSdcPH
         9z/XnyZIpycdnry5HjyZ5b/HAxLoDPavVrHUsK80h0N9TrX9c5v5Soql5B/dMEHQ0UIF
         HVDg==
X-Forwarded-Encrypted: i=1; AJvYcCVXx43S4BefCB2p61FjLS1s9wf1QMFzBYzFREkCo63Flr5g8kfXpt8Zidsr5cOaFBza9DODRbpfrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSGisDkqtsMR2nnZ/lWn71iAEXBBwT46Wyixd7uk6xGfUepMP1
	raUHOXv69aMKqSJiS8Flkl64LkpG9yudUeMWMKb5hFFFVA1V3NDLT02kWjzvKNM2WJ8=
X-Gm-Gg: ASbGnct2Qx+JXalX4ckHOeBSQh9ST5Oo/PqOkTiCDfuIKbjk/dYh3oTfl77apWpueAw
	+fWBZ6Fc1KZMnwIiPwD3T1GQKV/J29RdyprUzwAShdV3nnsufT9/chwPlSsdzYIwmoFRpmIw5FQ
	JCiXHtUyfu/VSXcjPmN01CT6JEXCl4RRxFjMwsyl0tLM9sKhzJoaNu+XLZ+GsGzg8yKQGW4rMCZ
	LfSCEqFCrNiJK/Y7tCIKrG6VRy7sC5r3z+dLCoKbbvWMQstf1vzdjSO42z/miReFCGJBJIt/bt+
	y67DP82pkGmmi2+qyQQPNgDP35QN92iolFK7gJL3KIeX6fH2nh4CF1fsWQWitALbcoDDx6a8Cej
	AONH2+yK5vLrMDQNayY6nW/wzmwkXZPuNnbTD8cq8AmiOZgmh8lpgAJXN3t7a5kooBn2Ls8SI1D
	cIy0bg7cEs5c7bcHK5
X-Google-Smtp-Source: AGHT+IHGLUiTqtzLxz7lFW1lX9Y3PBwmaxFa80wh+wM2x5l9w0PsCrOK+nmIqYNhug9aW0T3WfX/Vg==
X-Received: by 2002:a05:6602:3413:b0:887:55f8:5dea with SMTP id ca18e2360f4ac-89d296b6ed1mr938651239f.14.1758203486168;
        Thu, 18 Sep 2025 06:51:26 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-8a484d05729sm81694739f.28.2025.09.18.06.51.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 06:51:25 -0700 (PDT)
Message-ID: <5956e320-7cbb-4d9a-95a7-720cfa6b9654@riscstar.com>
Date: Thu, 18 Sep 2025 08:51:24 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: define a SPI controller node
To: Yixun Lan <dlan@gentoo.org>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, p.zabel@pengutronix.de, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917220724.288127-1-elder@riscstar.com>
 <20250917220724.288127-4-elder@riscstar.com>
 <20250918133209-GYB1273705@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250918133209-GYB1273705@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/18/25 8:32 AM, Yixun Lan wrote:
> Hi Alex,
> 
> On 17:07 Wed 17 Sep     , Alex Elder wrote:
>> Define a node for the fourth SoC SPI controller (number 3) on
>> the SpacemiT K1 SoC.
>>
>> Enable it on the Banana Pi BPI-F3 board, which exposes this feature
>> via its GPIO block:
>>    GPIO PIN 19:  MOSI
>>    GPIO PIN 21:  MISO
>>    GPIO PIN 23:  SCLK
>>    GPIO PIN 24:  SS (inverted)
>>
>> Define pincontrol configurations for the pins as used on that board.
>>
>> (This was tested using a GigaDevice GD25Q64E SPI NOR chip.)
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>>   .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++++++
>>   arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
>>   arch/riscv/boot/dts/spacemit/k1.dtsi          | 19 ++++++++++++++++++
>>   3 files changed, 45 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> index 6013be2585428..380d475d2f3f3 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> @@ -44,6 +44,12 @@ &pdma {
>>   	status = "okay";
>>   };
>>   
>> +&spi3 {
> ..
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&ssp3_0_cfg>;
> Can you swap the order of these two pinctrl properties?
> Yes, we currently have some inconsistency in tree, I plan to fix during next cycle

Sure, I'll do that.

>> +	status = "okay";
>> +};
>> +
>>   &uart0 {
>>   	pinctrl-names = "default";
>>   	pinctrl-0 = <&uart0_2_cfg>;
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> index 3810557374228..16c953eca2aaa 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
>> @@ -28,4 +28,24 @@ pwm14-1-pins {
>>   			drive-strength = <32>;
>>   		};
>>   	};
>> +
>> +	ssp3_0_cfg: ssp3-0-cfg {
>> +		ssp3-0-no-pull-pins {
>> +			pinmux = <K1_PADCONF(75, 2)>,	/* SCLK */
>> +				 <K1_PADCONF(77, 2)>,	/* MOSI  */
>> +				 <K1_PADCONF(78, 2)>;	/* MISO */
>> +
>> +			bias-disable;
>> +			drive-strength = <19>;
>> +			power-source = <3300>;
>> +		};
>> +
>> +		ssp3-0-frm-pins {
>> +			pinmux = <K1_PADCONF(76, 2)>;	/* FRM (frame) */
>> +
>> +			bias-pull-up = <0>;
>> +			drive-strength = <19>;
>> +			power-source = <3300>;
>> +		};
>> +	};
>>   };
>> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> index 66b33a9110ccd..a826cc1ac83d5 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
>> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
>> @@ -834,6 +834,25 @@ storage-bus {
>>   			#size-cells = <2>;
>>   			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>;
>>   
>> +			spi3: spi@d401c000 {
>> +				compatible = "spacemit,k1-spi";
>> +				reg = <0x0 0xd401c000 0x0 0x30>;
>> +				#address-cells = <1>;
>> +				#size-cells = <0>;
>> +				clocks = <&syscon_apbc CLK_SSP3>,
>> +					 <&syscon_apbc CLK_SSP3_BUS>;
> ..
>> +				clock-names = "core",
>> +					      "bus";
> can you simply put them together in one line? it's kind of tedious to split..

Sure I can do that.  I've seen it both ways.

>> +				resets = <&syscon_apbc RESET_SSP3>;
>> +				interrupts-extended = <&plic 55>;
> why use interrupts-extended?

Because it specifies both the controller and interrupt number
explicitly.  Why *not* use interrupts-extended?

>> +				spacemit,k1-ssp-id = <3>;
>> +				dmas = <&pdma 20>,
>> +				       <&pdma 19>;
> .. em, so the SPI will use pdma, then probably you should also adjust Kconfig to
> select PDMA driver?

You're right.  Thanks for catching that.

					-Alex

> 
>> +				dma-names = "rx",
>> +					    "tx";
>> +				status = "disabled";
>> +			};
>> +
>>   			emmc: mmc@d4281000 {
>>   				compatible = "spacemit,k1-sdhci";
>>   				reg = <0x0 0xd4281000 0x0 0x200>;
>> -- 
>> 2.48.1
>>
>>
> 

