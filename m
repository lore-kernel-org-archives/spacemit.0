Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AFC1C8611
	for <spacemit@lists.linux.dev>; Mon, 21 Apr 2025 17:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745257220; cv=none; b=Vx4DVp/Kx4Xoe8XGdtSTQ3PPaeUfxsy2FQ9hzK1VxmMSRdiCpgjhNn0uIl5JWK8MQvfW5O/9ITu4/4Va0N9aFS7Ywu0GJ/QdjrTrjNsoXuNQD5NJvk3PDoJr1bAjKsFyiA4SowEt3j35LUfLU39RYRfFWjXkGQ/nCDq/K+KtYrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745257220; c=relaxed/simple;
	bh=66L2iY9H9WYl2CXA3EnQx1lmEezQGIEG61bPGBz+f9k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NVDspzMb2B/kx0TKeThWxLJg+dfW7Oq45xQQVBbt12NUPMEXOf0ZqQqjWBCvpQhDk71ShUPQDMeKQqpqaUoNVc9Deey/c7G9IkROc7Qly3vnoyyx5PLmVkh6DhUQJPWoZuQzasw5pL8udOS2822z3TMqtFCGE62wMia5XoVGdn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=pFpCBjhp; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="pFpCBjhp"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-6e8fc176825so35471486d6.0
        for <spacemit@lists.linux.dev>; Mon, 21 Apr 2025 10:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745257216; x=1745862016; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aKl9K7y0OZr7wC01nlMRwEWzh4W8ODSSw6dPpbMz4Bw=;
        b=pFpCBjhpRKUCjgHJRZrk5XLD4i3WXXdT2+gMOvvmj5kABXHBLqzmQHr6LigYGs3Msf
         yLQvF6DGttCs6P0SEQxG0sG8OyNJtY15E3a99DrUptECQroguBqFSkvRuRmQyLdKx6lE
         lFMjif3h60vm6GwIhuJwrlxJl0UKFCpiik8ccVFC4wgq1Kkn+yAgyTT/P/0S2bGK6tq7
         kq5mS+TZb1owvaPoi+WLticb/rqSwSnNX2MoTU4H4VwbIw7JgYVu8LUI1U3GqGnHphUa
         kjvk9w0fv9lhlni1XPqebkqtT1CLbbzYC2e6v9pud8R2nUaxJWiACYe4Sd9UHY+eah0+
         uwJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745257216; x=1745862016;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aKl9K7y0OZr7wC01nlMRwEWzh4W8ODSSw6dPpbMz4Bw=;
        b=gfb9brqGppzbKWU01k/NP7zjJTH+BmqgMgTINCiImuJbS6SbSbBZ3lROkb1jYkFyRt
         QIeYn2uTDD5kn2Br2UvonRywQFP5wJzpEMoqcfXCRhIwtdEHVOjkE1s8m8K5sDCTe66g
         /ipMUeBJXv+Iya6LTE4qU0/yweIH47dqg1qCTG9qNzbHzaVnSCTGsSJdtZy8PZ63DJtx
         QP4bTUzcbv35R1mJgS+/XdXtB8OQydtoOGGn0IBQJlYtVCWbWDvAzYmC0VDdcWg0CCCu
         j3gAXRV1TtohPd+dI4xdYG0IAQ3O4tBMoEiAMpiPBG8f6lB4iC0yWUivKwkB1P6RK/xS
         lvrA==
X-Forwarded-Encrypted: i=1; AJvYcCWnIh7iTAMSSj61tov74zdLfnc95YCkosKR9tNXxmFhdQd1ACmgFI7ovYjSKj2TzOZzJa0PgEo5wA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx6wgYFsDQITHanGlFj03RfQJjN7L0VhNZECSGLerEdJb6eGJ7L
	Iivqo6EXqtYpDz0gspjIea3bygxuEJm2w8g/MUL9P4CoiZt0sgYXjhuQvni5iqI=
X-Gm-Gg: ASbGncufuzHafK4J4diXcFgWrIJsD0xkpanWlrZNEq2yESNbwmBCkuqdwCCEAPmH+dy
	kLWEmGv1HaYcui1okrn6AT3rBmane3RjD7uA1FO2t4XVuFp7DO7tPPgn0GA7rQpcVIFhqD6U3mC
	D48WWaW+trtlqDc1Twkk36Ev8aP6aHBFsaZphaqzohRLeJ1jHpPGsbP4TWakaShjMP86LvbD2/V
	uunZtubaddBABIVHf22vZ8IbEy5OGndh1nMb+rbUA3rRb8dwGCSdKn+GBhZI5BV8/oPSYSBHwFR
	2cSOuMYX5N8U88y9vAbsiURloAbgRjqyQMOMwRUxTSSJRKps2omWe8vjphuxzl3mySq9SkamBGo
	9qkYO
X-Google-Smtp-Source: AGHT+IFKSFfC6wpoUNvWav/Eqan/OSxBfbY3a7qMaAdUxlTtjGB0fwBAnW5re7pY3Pjp5k2BOvypNA==
X-Received: by 2002:a05:6214:500c:b0:6e8:9b52:7a1d with SMTP id 6a1803df08f44-6f2c450edd4mr263991346d6.8.1745257216244;
        Mon, 21 Apr 2025 10:40:16 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af120esm46284596d6.1.2025.04.21.10.40.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 10:40:15 -0700 (PDT)
Message-ID: <81788fbe-1344-49c4-9619-ea95956ddf15@riscstar.com>
Date: Mon, 21 Apr 2025 12:40:14 -0500
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Acquire clocks for pinctrl
To: Yixun Lan <dlan@gentoo.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Haylen Chu <heylenay@4d2.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250419-05-dts-clock-v1-0-1cce5d59aba2@gentoo.org>
 <20250419-05-dts-clock-v1-1-1cce5d59aba2@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250419-05-dts-clock-v1-1-1cce5d59aba2@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/25 10:32 PM, Yixun Lan wrote:
> Pinctrl of K1 SoC need two clocks, so explicitly acquire them.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>   arch/riscv/boot/dts/spacemit/k1.dtsi | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index 584f0dbc60f5b0d078c7127cc4021ad6022cb182..153fd1160182b42fe1a2f7f042c9c1da90f63b0c 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -450,6 +450,9 @@ uart9: serial@d4017800 {
>   		pinctrl: pinctrl@d401e000 {
>   			compatible = "spacemit,k1-pinctrl";
>   			reg = <0x0 0xd401e000 0x0 0x400>;
> +			clocks = <&syscon_apbc CLK_AIB>,
> +				 <&syscon_apbc CLK_AIB_BUS>;
> +			clock-names = "func", "bus";
>   		};
>   
>   		syscon_mpmu: system-controller@d4050000 {
> 

This looks good.

Reviewed-by: Alex Elder <elder@riscstar.com>
