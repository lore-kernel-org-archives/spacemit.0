Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7073EAC66
	for <spacemit@lists.linux.dev>; Wed, 11 Mar 2026 18:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773253671; cv=none; b=bY7Qv1DTIPWsTM3LrzL1ejB4L7jTHnassmgT8v1nSA+PeinfJf9xwY7qz258ENxGhMYPl1i+DI8xyRkLGSFRVMaryzUa+oxVP5+XjTEX0MweT++hYGuLR6UcDx0mKpnBL+yf2W6D0Q4XYS4/gacVc8CMsv0lYeo+HGOWznFPeoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773253671; c=relaxed/simple;
	bh=TjoT+QU7DQ256ZsGTZFZQrOx2kdA92zG7jdhyfIW6OQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Mzg0uZPo7C5131MI6a73lsIiZ4ABAxZAI1Sxdp1uTTPYN8B+v4H8ot4OM3410InYUtMhLm7OQeLBIxyMMVeDzZ/APOMEbg5WarZi9Xu9eSFBF3fPhv/92pTOnb7fyfCBucOGRzkkEa/U8Mj/jdWy2qJGrl3s4u3BdWw0f5kjf/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=XZQpHvKn; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="XZQpHvKn"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-50934b8ab60so13328441cf.0
        for <spacemit@lists.linux.dev>; Wed, 11 Mar 2026 11:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1773253667; x=1773858467; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=C4T3EYxVrqjxWDRGqLWvtRoRBBjnZaG3jGkRoHcrE0E=;
        b=XZQpHvKno/L/g/1pixP9/cNuTtGYwjY2fC4NDQGkU7UCMLFAYbM0hxfPvT+fgsAbr/
         BpMkcnFTu8CYRMcYiLEmc/00a6lcj2lGieNiZBTDRAQBGiOh53MW6tPCmAtj3JH0C/hh
         Ac8xi9cyu0PBHzFv8YELtfyBqa5detKanB3kINw9Kc8roI1SD/tonNnpRjycPCgmbpoX
         PKLKqAMUrQYz+ad5JiT7kVHM7I0AEYNzosmJUH2YMgwZf7NgEsI//QL75vAbtAgScoG5
         AEn40qVWXP40L+EyLjMDQIVa+KTFpb4XEjyLo/OgrUGNFBwJYrlki42PX30d+J5pZIvz
         WD9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773253667; x=1773858467;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C4T3EYxVrqjxWDRGqLWvtRoRBBjnZaG3jGkRoHcrE0E=;
        b=aY79fx0g12HOPpGD/aYu7XDzA0BUBcGcRs9UcYvvbYbqvPapmIwlNLCM9bWX6FsACs
         QFxqHWG5ptkHIzmyi4hk9ddP5akG2f6NTQZKpmKbLu6VATbzMf2/2MkynkJexEYtPKMS
         eNI4zZ/bjJLJOQzx5UrhigKunWB3AlgnU8sfvLieTuOs3F6EQTF3/bJRzuC0SmHUfX1I
         kvbVq3sI//E9kqyZE53hbhxzGt04/As6U84Aml7ZB4eaQogICY2LpKoj3eNBZmYk1iXf
         NVTVk7R0u1Kj0dIFtN86LZZ4JTs76M4p8OJIc368AaNRDQKKZfO3MG6TKubBOHVy9rum
         B/0w==
X-Forwarded-Encrypted: i=1; AJvYcCXWQfXjyJZRviWvxq3Rhya9EJTIlvBA7+3w2Ntx+WdVES2OKWV3mvG56Z8xAVJyDGLxCQHbE88DaQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwN+5tVfTvrsK/uUS6V+HBbFae8wISzix1jhW7EOCipgwKWr6sz
	FuXbEXVu5mqS9cixZDHm4y3atULg5pgw2lB64xTxdcOy2TD6t0O3ELNEf8hFnnQU8SM=
X-Gm-Gg: ATEYQzwDNeYicrjIdeg71hw2AbKHTODNnmxh+h8OtLSUeMo+rM7SJ3jc7GU8FkLv4rg
	QncV/o6PEfiPE8rvzbLZMiTCQYRa1NfxIwa+mj8TjAZXs7Z2JWcm0wHAiRy3VIdMO1o91GVgLw4
	JK7idRnCkCJnOf01SGA6NLrQEIwdm8EeeXUWLHqToIBrEzX9ar+sClJ0MNFlxBJLXhv0m7EM76K
	23EcyNjhA+CfFtyLCXNykipvTX/7/5MenMNZIy0ATlbHrR3bjxl0v9Bu6vMy3uZZ+5P1huM0MGv
	F47/zfJcoWsp/W1i7rOezhWdRigtEfa+sabpdEBpaKmc8vw40kEvcZLkVeVLQ9/nLUt+7Jalp8C
	ruNT6bpL30DQ6camFeR94QuCsYOLG/aTnVCWsDxaLSlqkWbIkb4Yvcco5QDNusALEaRccW1zsdx
	JU6pfRmttn4XNbakoZ9HiNI54o89M4F9HCsDc45O0lmHBJQM+GjwT7t8lqlxnwhBMAkLsNJb5C8
	VN/PdZd3zq2dd8=
X-Received: by 2002:ac8:7d91:0:b0:509:214a:e521 with SMTP id d75a77b69052e-509471aa41emr7984991cf.10.1773253667086;
        Wed, 11 Mar 2026 11:27:47 -0700 (PDT)
Received: from ?IPV6:2001:1970:3847:e000:4c82:63a9:39e9:5c17? ([2001:1970:3847:e000:4c82:63a9:39e9:5c17])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65beb4b3sm19327296d6.14.2026.03.11.11.27.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 11:27:46 -0700 (PDT)
Message-ID: <8e91c86d-ea41-4535-a7cd-5b602c546cb7@baylibre.com>
Date: Wed, 11 Mar 2026 14:27:42 -0400
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Trevor Gamblin <tgamblin@baylibre.com>
Subject: Re: [PATCH v2 6/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC
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
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
 <20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com>
Content-Language: en-US
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2026-03-09 07:40, Iker Pedrosa wrote:
> Add Spacemit P1 PMIC configuration and board power infrastructure for
> voltage regulation support.
>
> - Add board power regulators (12V input, 4V rail)
> - Enable I2C8 for PMIC communication
> - Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
> - Set up regulator constraints for SD card operation
>
> Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
> ---
>   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..414b03f5e6480f05f5d7eeaaa0afb4e86425ae36 100644
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
> +
Is this the correct voltage? I don't see a 12V rail in the RV2's 
datasheet, and the board's specifications only indicate a 5V USB-C input.
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
> +			sd_vmmc: buck4 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-ramp-delay = <5000>;
> +				regulator-always-on;
> +			};
> +
> +			sd_vqmmc: aldo1 {
> +				regulator-min-microvolt = <500000>;
> +				regulator-max-microvolt = <3400000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +};
>

