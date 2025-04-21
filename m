Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685A61EC00C
	for <spacemit@lists.linux.dev>; Mon, 21 Apr 2025 19:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745262684; cv=none; b=ANrkm0w8KiHz+Hbv5khzjZZDUIAaRJyTD5vsryRWyQOxSWSkGbVA615J/EL0AsssUylXecW0zlt5GKP+lenmyugTeeRyQEQKOg0heHgzpDkSdqLoeYZ964yLKg9SrzGb6MnIA1e4KJJZkJkjHdgvZGyzQIOD/RJj4VcVngPX6bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745262684; c=relaxed/simple;
	bh=8PYakAlyro5zJa4mSrGo6B1JdD1Wy5Jt8irra5IfyBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rXjclKR6Wv6yQWwuWAR2kcNoUst/TkNRhvYKeR73Q+LPAVPczVCn7Yj09BAdz/Felvf7PH1dLT4Ogb9myQpZclMAYOrOjdDgeHm0fNjVNruFDN4cHW97ugcRKUkhj1xbRmb0SFO2b6jSU1DP6MEj93gjjHrIEIJwN0tgaWUQQls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=gLdrmCo0; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="gLdrmCo0"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4772f48f516so53065081cf.1
        for <spacemit@lists.linux.dev>; Mon, 21 Apr 2025 12:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745262677; x=1745867477; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wxyUs0OyB6PY4ktlF6VOi53xW7dyCbW5pgQaVkoPnVQ=;
        b=gLdrmCo06ix5tprobdudsSiw2L2x2ZXzNdCaZrKD54yhRHRY9DnVNzw4FBRcW1qPTM
         1rJLdldfZGG/H23RHOR7WKBCYMNWXefiiFzuO90sXYZrJ5mB8phlYzEFQxysKCxWNF1S
         EG87kZL2if/d+Am18ByhEGxRHRoC1e4nHBccNBgYz2bKS+MRHiYZz1rPtcrQKv1BYp2C
         knZQ9NEPx7E6SFBW2xmwlbgmkQ/2WoR18s865tJEy0P/rwy7UkcriV4Y5Qb+Oef5bFVL
         cWCu4pAHbtJj2SWkHvG+wNI2em/lapqIwYCFArTuQyWo0MbrGXQHBFvY09KHZ9gA/Byz
         9pAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745262677; x=1745867477;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wxyUs0OyB6PY4ktlF6VOi53xW7dyCbW5pgQaVkoPnVQ=;
        b=bVyWuyQvsm/za+0SrZ/hX+n7dOhoO9UYh6dTpbQQlurm3I/QAFWx3A5YElnggysvWN
         gnHpkjNwHivYFShwY2ysqD3jsfc14104nJhrNjp2LY16HwsCTQpOVlho7R98S/5ct8ke
         BNSugqr/NmMKCu3EPwbQeCIfNrzQbD9EHqIY3v8sOLLDbPQlrdq5DIEawBhqcwCsokIW
         JUED1+DfmV1p3j5YFunshsDtc0GYZvH+uWa81vsJnvjAIA709u75ZYICKr+KPQRtyOw7
         rHyxNaxFJyNkovUs+yTLSoJD+LXv124+NNXIYUpgJzyMAX77hSJ8fuWhA3FuRjmpgoT7
         M3Cw==
X-Forwarded-Encrypted: i=1; AJvYcCU7TjshClodBabAoqAcuiWZvWm+DzOmoXyr3mTwZ0MANCNA1YlO6JH+Phj2gTKlrzs7YURzAUNk5g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzT/09mm84XAYN4mna4tIMgesMjIkJIpOgon62bSs7WniBxTpVE
	x6iqDl6g//X01OEG+7bIXYhpSWevPdk8iKlcAX3WoVVdNoPqkSu50YFxBhZyB1A=
X-Gm-Gg: ASbGncsuNFUR7uIG1eNR+dn8jHmKDICepJCJ4RpzmVQ4LXHlZ5a2O/uU4lCD7aRQLGu
	AfzbHvUQ3QZPBPfmw9srWtPz9CF8ifagzfJWvRwgVlOc8TA3Rho/5HjBU77ydfuzl1lMIrPBb4e
	lW9SCDtTRKmIhd/BixvwQsR35weLxjUKtC4qiy/b2gPIoFjSJmYIRoSSlGhoL9fPhBq5O+VJgJH
	KM9rG6hsOdaCLMwRIb8A3/4cyS0wfXbk5ODKWRt7FQwobJ2T0eg0j5D9JBwCdRp+xjTO3sPfYwN
	YZqc+BDWiVI80dtpU65iCIMFsayLNSPbeuDJDr8nYdGFtKNgOWpI7VzTkLWhp0A/Kz+pebdaPhi
	zGlew
X-Google-Smtp-Source: AGHT+IE8DZnLBNjUXN98eE0o/f4gMGDTtMaO/BL+aNlsPXo+fPOuUfQ1NdNuqmT1zTZSez0uNY8scA==
X-Received: by 2002:a05:622a:1c19:b0:477:84f5:a0b with SMTP id d75a77b69052e-47ae96515c1mr236320951cf.2.1745262677629;
        Mon, 21 Apr 2025 12:11:17 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9c188a8sm45206481cf.8.2025.04.21.12.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 12:11:17 -0700 (PDT)
Message-ID: <8e7cdada-6623-41ee-8839-b6db1d24050f@riscstar.com>
Date: Mon, 21 Apr 2025 14:11:16 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: spacemit: add clock and
 reset property
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250416-02-k1-pinctrl-clk-v2-0-2b5fcbd4183c@gentoo.org>
 <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250416-02-k1-pinctrl-clk-v2-1-2b5fcbd4183c@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/15/25 7:15 PM, Yixun Lan wrote:
> SpacemiT K1 SoC's pinctrl controller requires two clocks in order
> to work properly, also has one reset line from hardware perspective.

You mention the reset line here but that isn't implemented
by this patch (or the next).

I assume the reset series will be merged soon, and if that's
the case, maybe you can add two more patches to incorporate
that in the next version of this series.

Other than the description, this looks good to me.  You'll
want one of the DT maintainers to sign off, though.

					-Alex

> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   .../bindings/pinctrl/spacemit,k1-pinctrl.yaml          | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index b01ecd83b71b5e9f47256adde23bc8b183bef05e..d80e88aa07b45f4a3d90e8217caf93d32655927d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -17,6 +17,19 @@ properties:
>       items:
>         - description: pinctrl io memory base
>   
> +  clocks:
> +    items:
> +      - description: Functional Clock
> +      - description: Bus Clock
> +
> +  clock-names:
> +    items:
> +      - const: func
> +      - const: bus
> +
> +  resets:
> +    maxItems: 1
> +
>   patternProperties:
>     '-cfg$':
>       type: object
> @@ -94,6 +107,8 @@ patternProperties:
>   required:
>     - compatible
>     - reg
> +  - clocks
> +  - clock-names
>   
>   additionalProperties: false
>   
> @@ -108,6 +123,9 @@ examples:
>           pinctrl@d401e000 {
>               compatible = "spacemit,k1-pinctrl";
>               reg = <0x0 0xd401e000 0x0 0x400>;
> +            clocks = <&syscon_apbc 42>,
> +                     <&syscon_apbc 94>;
> +            clock-names = "func", "bus";
>   
>               uart0_2_cfg: uart0-2-cfg {
>                   uart0-2-pins {
> 

