Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4848D1BF58
	for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 12:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755087599; cv=none; b=l/Nrc9siuUTmdwXmQyoFD3A2SbTv1OpGZRGMddI+P4vkLjh5mxwdTNt3T0IXhyHO2CDaaocgxT581HFqAHJgNxxjfD6A4CWrzl7CpdeOHnDoTdt0zNwObkKz5QOAbXmZJLaS4GwqJg5kOW8QqEbOwrfzkNu8f3xrLk8Ym28r+O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755087599; c=relaxed/simple;
	bh=kWwKf+d7Rq93hRlGUo/OEpdJd14FbNbQPT8V99d72Y4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gbo1dGkks+VeHSrImWJ4VxkCnfIQjK9qfX7k+rpBgyi/taBz39MoYaNypxKut4nY3/81SGPZntK34gaMnWPvKPJBTsEAgvtW5korMmoVyyfTq9VXRr/15bIOHFrSIpbLjGOYbZZ65zGGqauEBhxWWJp8G5ItwotRHtvcALDnzK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RIY1rgnY; arc=none smtp.client-ip=209.85.216.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RIY1rgnY"
Received: by mail-pj1-f68.google.com with SMTP id 98e67ed59e1d1-32117db952aso5375506a91.0
        for <spacemit@lists.linux.dev>; Wed, 13 Aug 2025 05:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755087597; x=1755692397; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wXIuy8E0rJ9utYVbR4lh364PTlYdCZUkNdbi7L0pG7A=;
        b=RIY1rgnYm2si/aDsz0skrXeTTMGPZQHU9nalGQeZ/e39KDMrlSx1M2bSib8QqS1SIE
         ZFp51kJkP9Ist5MCccQlPV4sZwJHHiT7ZkJL1zrM9kBIaOb4yNKXGVgPyYGlT9AkSP2T
         zlbfWX+PT5rOLLH3SpD9d8nTxd6+E8VM4N/VrNE5DvvNDP2oPtxZgrIMOik6lsb6rqXd
         TZClMaT9KmeaKLl59bUq/0xy0MSX52/uk55B5HO4hpJN4URiCEuuV0nYA6KTkbP38W8q
         Phf3FIwMNY5aVZUyMG/zxSoEFsU3+qzRmWnPsv/9bcUFZuzSln0VzILJEbn5nFJ/vETo
         9elg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755087597; x=1755692397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXIuy8E0rJ9utYVbR4lh364PTlYdCZUkNdbi7L0pG7A=;
        b=UBkZB5M0CeAnWESXeFX7apayspprSyXTM81zHflgkXjLwapIr2cF+4F23aBIToS02b
         +PsUoSV+HKdkVlt4IvFgoIEEwpmDl3Y3I0qg/CSQNS77UVkdIAt7p2CkZIe6S2UdQR9h
         3/hWJ7TImMB2u+/pvTg2affeIYdIBQzfP3DsX78Izz+ylBj0UsK8xOhBnuwGTCs5N97Q
         ZINWsQjW7ykrCkjQNhMkDBFUH1wgikbRKN1BHCUk9C0DlMpj5PsxhSuEpxv77Ttub8iH
         RKzgH+Qhpljd1ERH1NoyCkBAmqrDCmNp2Ww/+qzCnvu3bO1LQuirNVfv4U2cVqpKm8UY
         Zz6g==
X-Forwarded-Encrypted: i=1; AJvYcCWLWo5aSNHBdYmX0Jm/jNqIgAIa+bEGiXE/Qbcr5rHuHqk/vmgIMBMb4cDlB4o/ZTdD1VYyYApDWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yza8OSorC4H+JnjXYDB4CLxfPoow47p+bjLTRpd6EiB8SAru2C6
	vOmeUmkQ3h87lu3ssrQZxmDm4Bvo54kR/PZhQgKCooMPYxAyjq/aNrPv
X-Gm-Gg: ASbGncuBiHKq6R15nj9JJ3JCajvBj8sBNg9WfW8ZgLNQlNQSWXXz104TpQ6sPKbAacP
	Xk21bcfYHBfjZeYZ1kkgO1kCojPlW7fpOL+z11NWlS7a5p79o8UfQsisQ0zT52DbRECmis+C9TR
	9X698u49UQZ2PTwXxBo5Ophp7L6zNXkViEw0D9NVM7L94MC2WietWADnqONQIQTbvb0gqZ6fyce
	WWYugYDZM6kGOoLOK7OB8UNwBrQT7d9JW+AhpOiC8dEk2Ir6gqq5VQoVpaTwoPI2erYvqmTJHjb
	ES6iqs3S2EQGpiy35dZbasLxOodPhA0b2uhL4mu6+xoQGdE+ClZI+bichx5vRMvUtw5wYYsJavm
	TysvcQRsjnR35HgxejqkyRZ071p0alJc=
X-Google-Smtp-Source: AGHT+IEFlXvKJVszOuCgY2L3pa333NYha1FOY/G7JfVFhsfManM3a/rZhg0qEyDVkRt5u2BFBdgGqQ==
X-Received: by 2002:a17:90b:1a8a:b0:321:1df6:97d3 with SMTP id 98e67ed59e1d1-321d0d42332mr3886934a91.4.1755087597351;
        Wed, 13 Aug 2025 05:19:57 -0700 (PDT)
Received: from localhost ([2408:8256:2289:c8ae:c016:1fd0:d59b:62c6])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3232580316dsm23954a91.16.2025.08.13.05.19.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 05:19:56 -0700 (PDT)
Date: Wed, 13 Aug 2025 20:19:50 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Alex Elder <elder@riscstar.com>
Cc: lee@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, dlan@gentoo.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v12 1/7] dt-bindings: mfd: add support the SpacemiT P1
 PMIC
Message-ID: <aJyC5q0X8mj1xbSB@troy-wujie14pro-arch>
References: <20250813024509.2325988-1-elder@riscstar.com>
 <20250813024509.2325988-2-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813024509.2325988-2-elder@riscstar.com>

On Tue, Aug 12, 2025 at 09:45:02PM -0500, Alex Elder wrote:
> Enable the SpacemiT P1, which is an I2C-controlled PMIC.  Initially
> only the RTC and regulators will be supported.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../devicetree/bindings/mfd/spacemit,p1.yaml  | 86 +++++++++++++++++++
>  1 file changed, 86 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> new file mode 100644
> index 0000000000000..5cc34d4934b54
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/spacemit,p1.yaml
> @@ -0,0 +1,86 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/spacemit,p1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT P1 Power Management Integrated Circuit
> +
> +maintainers:
> +  - Troy Mitchell <troymitchell988@gmail.com>
You can change it from this to my company email:
troy.mitchell@linux.spacemit.com

Acked-by: Troy Mitchell <troymitchell988@gmail.com>

                - Troy
> +
> +description:
> +  P1 is an I2C-controlled PMIC produced by SpacemiT.  It implements six
> +  constant-on-time buck converters and twelve low-dropout regulators.
> +  It also contains a load switch, watchdog timer, real-time clock, eight
> +  12-bit ADC channels, and six GPIOs.  Additional details are available
> +  in the "Power Stone/P1" section at the following link.
> +    https://developer.spacemit.com/documentation
> +
> +properties:
> +  compatible:
> +    const: spacemit,p1
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  vin-supply:
> +    description: Input supply phandle.
> +
> +  regulators:
> +    type: object
> +
> +    patternProperties:
> +      "^(buck[1-6]|aldo[1-4]|dldo[1-7])$":
> +        type: object
> +        $ref: /schemas/regulator/regulator.yaml#
> +        unevaluatedProperties: false
> +
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        pmic@41 {
> +            compatible = "spacemit,p1";
> +            reg = <0x41>;
> +            interrupts = <64>;
> +
> +            regulators {
> +                buck1 {
> +                    regulator-name = "buck1";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3450000>;
> +                    regulator-ramp-delay = <5000>;
> +                    regulator-always-on;
> +                };
> +
> +                aldo1 {
> +                    regulator-name = "aldo1";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3400000>;
> +                    regulator-boot-on;
> +                };
> +
> +                dldo1 {
> +                    regulator-name = "dldo1";
> +                    regulator-min-microvolt = <500000>;
> +                    regulator-max-microvolt = <3400000>;
> +                    regulator-boot-on;
> +                };
> +            };
> +        };
> +    };
> -- 
> 2.48.1
> 
