Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7508352FA6
	for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769606937; cv=none; b=QRi2Zm5LZDfaUXEdk/ox122cSk93e9kf4fqNaFqULVzAqDbobMqHlExyZOtPwOFrT3Ekdkv1kr3lsmEjBY1yte4wh8VXn5yL48UHL+Xh0+BhCUF+GQjRwK5Qf/gkvO4YpKKza6zNo44cXXoHg6F59hm5GD17dLYb92fKvgCc550=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769606937; c=relaxed/simple;
	bh=zmxOPeXvnOtchYfum5MfPM2ufP91Bp+oj32pDPeoclk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WYlQz1tlpp/et5Jmb9YKy9A1MsiemrqOLYkSt3VgDonYXLDbQto/T1kHNcfmh6W6X0wja5687LmWdp9jAMI64gFapsU34UlO3OyuuIiRkLlSh5Cqff+RjBw1Lv7WYKg7hSifpuIkYg8/awTVelw2KiD6C92dOLdeISL1x44hGvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Ak3JfbEQ; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Ak3JfbEQ"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d18d0e6d71so580653a34.1
        for <spacemit@lists.linux.dev>; Wed, 28 Jan 2026 05:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1769606935; x=1770211735; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l7l6hZpxqhowIar9wP3g3p3H24Q2QksV27F6NMf90mY=;
        b=Ak3JfbEQRRNsMupJ+mmWXlEIaJGiHoq8cxEg++k9qyun0Ezvsp3TAe+/cfhjbF4Q2L
         pSxGJMK0u892InrXcNhtgrviSqsRrUg5z1TgKel6K8GRH4g/KsMHOwui04nG2hFu1YP1
         PBfm0prAeOFTZOQhOEFncoFLNCq1gk6Fu0YK/XXR71oF6kICJZBD4nm7v0UPAeP23bJz
         g6Df7UifeQmrTay8PtnicNZPSl+zpfj04n0X89zrcwwPWA8rUSv0xR3jLo6MvumHh9FF
         vRSY1rrhqtJ93UjhIPg3EragHREFq85kBB/0Cf1OGgMy2/ngt6XBp5/Ja9UF5g3bCyEB
         DR+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769606935; x=1770211735;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l7l6hZpxqhowIar9wP3g3p3H24Q2QksV27F6NMf90mY=;
        b=XURS8EeNQO09PDw4WPqI7oCOizfncJirCJW9SjQpXWgYYUzhwOM/8Z+ra0k4yipTq8
         FcncJq7YmmaO5hyiB3vhLhdaDSKwkLcRPBXTNc5prTTwAZHYKeXvGhXsCMWO4wb3Vqc+
         Xhwhwgs9oAUVGRgIk2iWhjtqemRSWC1tOrYq5gH6rE7jOsrn8cfbrAZQtwKbHVtf4447
         97DMBD9HLudYty1j5G+6TBvdmnd8izIzO3WZSo0PoORzyK7oYGn4Cjn1geA631gPQ5NL
         WldEd7QpJxNU7i+u22Oh1gFJAg30JawJQLRyFA5/cAyFKOHuTQzOXC+ZlCjUX8IaYbfL
         CnNA==
X-Forwarded-Encrypted: i=1; AJvYcCWykDmOUo85fBID9Y6mvYX41/r24eR/ePWY6WoSbx7qJtnRN72ORHwRCuydyXwpBRlU4EWYCrB9Vw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0VLB1bxJQoodyIwSLHqyUg7hH24rSsTyTBbwaWVUF7OmbC1mE
	XmAmSLd8jr+mc1cC6e8foE3EVkMVGoqPZmP4VecaUvt+y5b7u8AzkLTLYTQdIch4T/chJcQrJyT
	OSIT1Q5M=
X-Gm-Gg: AZuq6aI5idzGzN7KuOfafwO6B54ryqJqdRldC/fmgWRnwF2opoqhcxQ9htS0lmuNNU1
	YuiKqFzG8HYFvr8OiwVRU5Q5RoC4Ak/w6RInj6zSItyUVOx8DR0V9vZ7E1pLp2xsreFZwJD1wac
	pmAaWf5+N/oQd8naRmxV1jx/WA/2EZdDoSVmMpivfuGACFycIxaixeiI6xboFiS9m3D48o/wNOl
	qNteMjmeSCVFZyVjIsOkW1iaRIdeibT2iK8+nKPQ1YamoU9hFdNfRcPMFV3ZPjsh6Gc70IoHVxH
	w5fj1jXEo1I+A/3FkS7XqyR8jMRMAz2OxvlXmVxf48llDr6sLBozluzisf+8bWJ9C5ItEUtH7N4
	oETTwDHYQQ4oDzT/Cdk8gTCLZgO4PtB7USKrbmQa4c8nEd8NJX9b+UgCpf4Tr4M10D+qiWNKS+J
	gOARa5NiezREp+Hj8ZShW1XoQYcg4G7kaK+GMIIEg72vSl8Vnd1bQ=
X-Received: by 2002:a05:6820:134f:b0:662:ecc7:7193 with SMTP id 006d021491bc7-662f20d5753mr2863092eaf.54.1769606934872;
        Wed, 28 Jan 2026 05:28:54 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f994388fsm1374132eaf.4.2026.01.28.05.28.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 05:28:54 -0800 (PST)
Message-ID: <5a1825e3-3517-4d17-aa8f-b0261245d9bb@riscstar.com>
Date: Wed, 28 Jan 2026 07:28:53 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] dt-bindings: mfd: spacemit,p1: Add individual
 regulator supply properties
To: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, devicetree@vger.kernel.org
References: <20260124-spacemit-p1-v2-0-2c86b06694ba@riscstar.com>
 <20260124-spacemit-p1-v2-2-2c86b06694ba@riscstar.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260124-spacemit-p1-v2-2-2c86b06694ba@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/23/26 6:20 PM, Guodong Xu wrote:
> Add supply properties that match the P1 PMIC's actual hardware topology
> where each buck converter has its own VIN pin and LDO groups share
> common input pins. Supply names are defined according to the pinout
> names in the P1 datasheet.
> 
> This allows different boards to describe their actual power tree
> connections in devicetree rather than hardcoding supply relationships
> in the driver.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>

Your additions match what I see in the data sheet.
This looks good, thank you.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
> v2: Remove providers from the dts example.
>      Pass the 'make dt_binding_check' test.
> ---
>   .../devicetree/bindings/mfd/spacemit,p1.yaml       | 49 +++++++++++++++++++++-
>   1 file changed, 47 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> index c6593ac6ef6a..c67b1c6e4e4f 100644
> --- a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> +++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> @@ -27,8 +27,41 @@ properties:
>     interrupts:
>       maxItems: 1
>   
> -  vin-supply:
> -    description: Input supply phandle.
> +  vin1-supply:
> +    description:
> +      Power supply for BUCK1. Required if BUCK1 is defined.
> +
> +  vin2-supply:
> +    description:
> +      Power supply for BUCK2. Required if BUCK2 is defined.
> +
> +  vin3-supply:
> +    description:
> +      Power supply for BUCK3. Required if BUCK3 is defined.
> +
> +  vin4-supply:
> +    description:
> +      Power supply for BUCK4. Required if BUCK4 is defined.
> +
> +  vin5-supply:
> +    description:
> +      Power supply for BUCK5. Required if BUCK5 is defined.
> +
> +  vin6-supply:
> +    description:
> +      Power supply for BUCK6. Required if BUCK6 is defined.
> +
> +  aldoin-supply:
> +    description:
> +      Power supply for ALDO1-4. Required if any are defined.
> +
> +  dldoin1-supply:
> +    description:
> +      Power supply for DLDO1-4. Required if any are defined.
> +
> +  dldoin2-supply:
> +    description:
> +      Power supply for DLDO5-7. Required if any are defined.
>   
>     regulators:
>       type: object
> @@ -58,6 +91,10 @@ examples:
>               compatible = "spacemit,p1";
>               reg = <0x41>;
>               interrupts = <64>;
> +            vin1-supply = <&reg_vcc_5v>;
> +            vin5-supply = <&reg_vcc_5v>;
> +            aldoin-supply = <&reg_vcc_5v>;
> +            dldoin1-supply = <&buck5>;
>   
>               regulators {
>                   buck1 {
> @@ -68,6 +105,14 @@ examples:
>                       regulator-always-on;
>                   };
>   
> +                buck5: buck5 {
> +                    regulator-name = "buck5";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3450000>;
> +                    regulator-ramp-delay = <5000>;
> +                    regulator-always-on;
> +                };
> +
>                   aldo1 {
>                       regulator-name = "aldo1";
>                       regulator-min-microvolt = <500000>;
> 

