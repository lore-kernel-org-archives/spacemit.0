Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80589254AF5
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 10:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767003270; cv=none; b=InhDrlQNUZmtgmsQQiesSd+vLQhPmHsoshV9ptiB2wQZ9MFK8Z72zR8cewBonnyVQy22GX8sNjThzH+3Jirxc5Y80Q7QFIWvFah2T+TX4D9F4wYTAjX5zpAyeu+UeUXZ33SeD0LmWaaf34GF7hvuoqlqexdljtp4ZQ9scitWgj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767003270; c=relaxed/simple;
	bh=QjWRuAaM50isJHR0IlGlClRluaxYY31CUMhi6WuQUsE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KWMmIOsiNlzRpyhl3uTTuj/eB1WSthLGE9KJvo3rcQBjPlzZe+/y3IcqEirb6oabsxOz1PHLbuXFAiCaMSKDoBazrWD13C6DiMRfmZFrT36L7ameevRyWu+WsHnNh/KILmvNnTPZFXZv7fcc9A/lRvss/RGrsSk9vKTvl3/S+H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FYrYbNgt; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FYrYbNgt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767003267;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0MeGtttQCSy+HkQ1P/XOLXh/i4l7g+qeOEMBCMGW53s=;
	b=FYrYbNgtcFWGKVxlgzWZnr7SOPBxaHfmDDrXI1+ZrpUXJXyLVTDW5G0mX/Qa2O4hK8T34b
	O7yq/Abbgo8itrM/7XsgqkcWM21qCjET4R4JEcURTU68B2/8hAwrdYrpqwXtngE9XE7W21
	UituaO9eD4U2+VAxcIqk9gt2ipQtVG0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-70-CLx4GDJUPheziAabDAt1Ng-1; Mon, 29 Dec 2025 05:14:26 -0500
X-MC-Unique: CLx4GDJUPheziAabDAt1Ng-1
X-Mimecast-MFC-AGG-ID: CLx4GDJUPheziAabDAt1Ng_1767003265
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-43284f60a8aso1038064f8f.3
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 02:14:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767003264; x=1767608064;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0MeGtttQCSy+HkQ1P/XOLXh/i4l7g+qeOEMBCMGW53s=;
        b=oPD0zdjENDUCRfyhR1BDxBckZa91Ii3OV+o9pYNaYSoc4x9PWCSCfSLB4t1T7gTTWf
         m5UkjwbZs6bqFw9ZqiCXvG7gabORxkchfOXkTJ4YgpHaXaBPinN5gWbRv76FVSoI+BGo
         xevtSEmTYJvLf5haUF4V+MG2r33LFDdQB6cVq7APYrBauXo9gaS3z8GQnbTqguyohtxE
         cy7dEhyCmZhb05NY+kWarQBazO/7wsXrSl5supcADuRRZfjKUJEZpsQk9JZK3TJd7O12
         X1PbUnSJ2iqcLnM0QGAsW9/3NJvKFQp6icbH6G8eBcTSSKyJDKlvU63am5hjUWImvNKh
         qZsg==
X-Forwarded-Encrypted: i=1; AJvYcCUkqYAduoBMY1hPuG+u6m3+167YpblF9Fp4pBOnebLwoebhun/wzjiXS9fL/dQwZOM39a3Z6433xQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwhhtVaF5WvoguleePfAJsQqeLNwfZ99Q3Xx9ptcedaxM9LYfZx
	iW4sr4x8jJxDt4dVGo5QpanfHuAu4+WUxW0ln3pAHZ3rc1BhB7g0RxLm4NR15IYmgOn7J4XQEzU
	820PFVa9SWeeS6Of4zwjENVT8rfEWPpH+HKXP72EH1zjEYApHgy1mtZ0FiImwcBk16tIG
X-Gm-Gg: AY/fxX7OZBGuigfd48OHzAxXutAOKFKBc7ObWC7LVgcuSkwp++eMrzYJSIytO0OEa/C
	/NMDOBTyvgl9Z9KEp0WVEO+KERITjxnC8wf9m4TpGxbmYYfgWU1Amnm5NIq6EUzjIlvMQcSr+9T
	ZzYoyJNoOaXEZ3WVaFUkM83juCFv8sXRszzheuZN9zJ5/om00PHKde9he8Jt0fJfuwAFwMP9yhN
	O2s58MP5ZJDhRrbzmI315hLwYSBBrh3B9NpSwcTFMjurq6sCBlK8gwBFvnTiE82i8UPBenISCCZ
	GXlcz5xOS7W6ZCDJMD6NVAj7lJJGb+OO+D50qrt5zgoG7ckVOy0z5D7ppLFM3cfdZyTynwPC1RU
	ivDwS3ovFqcFQ7/D4AAQk2EVEY+bTCf3AlCenNsMXoRso/qJzaMJ9IVDivuy1SZqaTsGh
X-Received: by 2002:a05:6000:2583:b0:431:53:1f49 with SMTP id ffacd0b85a97d-4324e4f69d4mr29072895f8f.41.1767003264189;
        Mon, 29 Dec 2025 02:14:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEaUX+P/aYJXLzomp8EeNsbkaHr1ZMGK/ODEhPXEZsAY+UeUvgAFBACIto/Ps2yRmhT3bcm8A==
X-Received: by 2002:a05:6000:2583:b0:431:53:1f49 with SMTP id ffacd0b85a97d-4324e4f69d4mr29072878f8f.41.1767003263793;
        Mon, 29 Dec 2025 02:14:23 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af20sm58270346f8f.2.2025.12.29.02.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:14:22 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Chukun Pan <amadeus@jmu.edu.cn>, michael.opdenacker@rootcommit.com
Cc: dan.carpenter@linaro.org, dlan@gentoo.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Chukun Pan
 <amadeus@jmu.edu.cn>
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MMC support on BPI-F3 and
 OrangePi RV2
In-Reply-To: <20251224150003.1232791-1-amadeus@jmu.edu.cn>
References: <20251215-k1-boards-add-mmc-v1-2-d68dc87d4aab@rootcommit.com>
 <20251224150003.1232791-1-amadeus@jmu.edu.cn>
Date: Mon, 29 Dec 2025 11:14:21 +0100
Message-ID: <87zf71fvcy.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E9SjM_XjhBgvyoQPrSXJPROH5KxeKHxrL9_M_hPtD2U_1767003265
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Chukun Pan <amadeus@jmu.edu.cn> writes:

> Hi,
>
>> +&sdhci0 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&mmc1_cfg>;
>
> It would be better to arrange them in alphabetical order.
> (Place pinctrl below no-sdio)
>
>> +	bus-width = <4>;
>> +	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
>
> It seems that "cap-sd-highspeed" is missing?
>
>> +	cd-inverted;
>> +	no-sdio;
>> +	status = "okay";
>> +};
>
>> +			sdhci0: mmc@d4280000 {
>
> An immature idea. Would naming nodes this way be better?
>
> sdmmc: mmc@d4280000
>  sdio: mmc@d4280800
>  emmc: mmc@d4281000
>
> This seems to fit the description here better:
> https://bianbu-linux.spacemit.com/en/device/peripheral_driver/SDHC/#dts-configuration
>

I initially thought something similar but it's not accurate. Because as
explained in the doc that you referred:

* slot1 supports SD/SDIO (1/4 bit)
* slot2 supports SDIO/eMMC (1/4 bit)
* slot3 supports only eMMC (1/4/8 bit)

Which means that only slot3 is limited to eMMC.

So even when a typical configuration is what you mentioned (and what I saw
in most of the existing designs), slots 1 and 2 won't always be SD and SDIO.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

