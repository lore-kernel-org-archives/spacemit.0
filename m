Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4633934FF57
	for <spacemit@lists.linux.dev>; Tue, 18 Nov 2025 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763487179; cv=none; b=IVuH3kG4GEEwwG3imCIa6btUqxpuekfMTYjaztgffxyq41L4u1NkrviEFSXvaDuvh0bp4O30pRdOiI/oLuTCSo/L6ZCECf2KxDlqt4vGakj1/+5GP3nLcj/f01DN+L1BywVcs+qHdwDXEqU0txSHoxgVM+QrJmrShGHg+iwBPoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763487179; c=relaxed/simple;
	bh=KKOBsYgKv97w/HfACS/VyWtNlPlmasWAsfEKqO5aXf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OKeLO3O1+gJQM1Lmge9yvfvVetinm1LjCkEp8Rfxo4Eg9nbZGbbhg5DeJuBaIUG0/FFF/adbvh82YLVfqMiC4TNcdAJmcd7/6D+0VEvr1Ib/DgGbPzK21v/Eayz9JWkf5TRfAejDZKK9I3gKNkqyc8I2Yp8Ej6roE0bQG11c6ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=zYdsHRJN; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="zYdsHRJN"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-4349044be0eso25549425ab.1
        for <spacemit@lists.linux.dev>; Tue, 18 Nov 2025 09:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1763487176; x=1764091976; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ec5izO6qQ1oFETz1h93VLus1xZ8qz7zlXuLKIwfS2RQ=;
        b=zYdsHRJNqA/3dmHjwF5oPcWpEeSTc6rEAPFJ6uTALbZU31JT9NovV4VD97HUCOqD0a
         6wldaY1tEoSHhipL8gwI2RnPoRu78HqqkZM2nYftEEWGy1Z1vF6r3cwiHObUny/Tw+n5
         v+AOtG03GsAj6O634MN5AR+mxSr4UbeLDxxEwxjAXkzFpAoqMNfpVqJaAQnffU2wTKYu
         AQjZ408iqXVAEckeI0rsD6A1rNpT6OlKU6i+nRSUnfYiXLibKLwU4KfS13Vki4NwPQAF
         eizfdv0Kh1ciwtwxwoioyWchCljSQtEZ5FsG9SkIC7kHVGKBaAueRqYi281p6x0uiGHJ
         E1Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763487176; x=1764091976;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ec5izO6qQ1oFETz1h93VLus1xZ8qz7zlXuLKIwfS2RQ=;
        b=dtLN5fFxTLIf+DlU9Vb1ESwrOjhu1cbLCYDtdqfVFSh7IDFz7CO3k7B6yvz6FDRi5J
         wKiqnSxET+3bFvyLq72/6aKqiUtvG/68ugXi9KYXhTvfQg5WkPCxnqZGNwavOoYfSzPE
         aOaH1ZV0+bL2KBbwuec3kXTGyeK8mU1PWpjhqcdErqXXDlrAS073EZMMJNaFUJ0YjCBY
         8ADyM3UP6ZKFEZB+Ch3Yj+BIQehsHKnyiufwEKfjLAaePscoql5aDGdZcs3bPJkRkn9j
         cB9OMvpvGsWIVqDqf7ZpjwzNAHBAkQpezbXa1rHfiK7tzecocXU3SRsegJfjHrhSkUsl
         Vebg==
X-Forwarded-Encrypted: i=1; AJvYcCXhehKziHUu+b53Iz0XIN2gSc7Q5YA6WHU07OjaQrXsBSrrzKTz0j96iklUQ79oj171lL3WDbrwvg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyS8vWZ3zaAiPwPPD0Ch9ez3duOdOqkCCb8ZT9EXAl29b0lc58O
	ITbVUcc3c6uQ908mptPfVrYIEMwozrvHGkoNWgiSGX64SoejDye5JJLfjm8xwSWD/Tk=
X-Gm-Gg: ASbGncvO6qRBhbNcHyxu1vV8fyktXIiRb2mv3oSrEeCPiSG8bu7qrkIezcSLJp7ATmU
	Wd9FtZ2qMixiEQkCaRAPZwiVkZEWvUByBrfCl1lMTvbK+SznaSyDz4tU3JDDt6CNLpZi+A5DvK7
	+3TMQgAFmnhnxAjP78BPR+uwjJgrbL8yHeaJ5cl/YnLJYzs7K0doo3vcIAZIz4DlkxMKRMalXw4
	o8RnrNZ5O675WTfQMtUpnHfDK1VbrDNVz8L/MAjBrDGa+WZ41EHMFIre/lAQRZD3up5kddpYXPm
	0zwzuL4fQ66uYr8wxJDhCsRNGjd2cEFuWkFwj+6ImbA2p4S3xdFh5fp97fUc9ruZXtKEVTWJS8s
	1NceP4akMA8VzKK4PzUyO5xEdm8xDr4KLrgJR2868FWR88H7T2ALaTXYkDcLP+QWWpOWcXrLFse
	1DnAPpFRufPpbNqNO++hgf2UCZzQN+fNgCy/q6pbsGJ/mWYB5lAQ==
X-Google-Smtp-Source: AGHT+IEZShSd2XdlTL6LQuL0eb9ZcN2CQs/Oju6iDycMXlqVGOaJYIbCBR4ngQaAmXBLuKdLttDx0g==
X-Received: by 2002:a92:c213:0:b0:434:a7c1:6b91 with SMTP id e9e14a558f8ab-434a7c16c2emr61797275ab.18.1763487176112;
        Tue, 18 Nov 2025 09:32:56 -0800 (PST)
Received: from [172.22.22.28] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-43483990056sm82570475ab.19.2025.11.18.09.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 09:32:55 -0800 (PST)
Message-ID: <1c43aa3d-a5e6-4260-9079-fdc2e05c533c@riscstar.com>
Date: Tue, 18 Nov 2025 11:32:54 -0600
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] mfd: simple-mfd-i2c: add default value
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
 Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Andi Shyti <andi.shyti@kernel.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
 linux-rtc@vger.kernel.org
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20251118-p1-kconfig-fix-v3-4-8839c5ac5db3@linux.spacemit.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/25 12:08 AM, Troy Mitchell wrote:
> The default value of the P1 sub-device depends on the value
> of P1, so P1 should have a default value here.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>   drivers/mfd/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 6cec1858947bf7ab5ee78beb730c95dabcb43a98..b0f109b3acc40b074e4d0178e123437495853496 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -1260,6 +1260,7 @@ config MFD_SPACEMIT_P1
>   	depends on I2C
>   	select I2C_K1
>   	select MFD_SIMPLE_MFD_I2C
> +	default ARCH_SPACEMIT
>   	help
>   	  This option supports the I2C-based SpacemiT P1 PMIC, which
>   	  contains regulators, a power switch, GPIOs, an RTC, and more.
> 

I agree with Emil on making this be default m if possible.

Acked-by: Alex Elder <elder@riscstar.com>

Thank you for these fixes.
