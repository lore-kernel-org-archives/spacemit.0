Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FEC2749CB
	for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766003122; cv=none; b=oogsQye91IKATJjnBPLYnS2aKtRZQgzAGhy9zK3YZzYD5rzqctaqM/INDsLKecK/bfhOwV1dGBm4dgHnOWjJvpDlNlol6nwG1W5ih2TqxXvnUGs0s7tqfO9y7L90xFEtY9LYghcxJFYfrakvCqdQq0Q1KRpaU7l857YpSM1nTSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766003122; c=relaxed/simple;
	bh=e/T/iXGc5Bfyb7Z5XD0yhKZqBNBo0NsrD3tCg5mA418=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=g/MQjVxlD1i68ywt0DkZTm3s/SITNb6o+kEwcEmciHIWZSYYk9fj9VxvsyLUxmx1TCE/zB37u921xyMPJY+zlNQoQOgBRQNUgnqDJnzAtmgAKEwtRxcwrtD3dzV8o9dmAdgRy8hulRCn8FgMp6JvAB2rAYoi3EzGZpY1v39PbPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a6LnWFdc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a6LnWFdc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1766003119;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=e4zb0T3CSvaS+O2fwv8L86wyH0tUQatLYZyrY/ySYrc=;
	b=a6LnWFdcy1pmsBnB2I9MD5cXVPME3NTTuc5ib3Mi2E39cUOR29etEaGO2ErNcBKjPoHsO4
	+UGmEG2xPQEinGYvbzFuvJwAf2m44fkDAL02tj4RQADArWsMgFOQyyBfj4MQpeSUqdNuzH
	xEaasaYDDpAaLPB3qkDYu6ShrV+Ny6A=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-157-vTbVJGcxO_awtswrwazn_g-1; Wed, 17 Dec 2025 15:25:18 -0500
X-MC-Unique: vTbVJGcxO_awtswrwazn_g-1
X-Mimecast-MFC-AGG-ID: vTbVJGcxO_awtswrwazn_g_1766003117
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-47799717212so51586755e9.3
        for <spacemit@lists.linux.dev>; Wed, 17 Dec 2025 12:25:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766003117; x=1766607917;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e4zb0T3CSvaS+O2fwv8L86wyH0tUQatLYZyrY/ySYrc=;
        b=R2Epe645CT+ejIYuVKIMpEFkGVoevLD8Z6JSh2XFuW7//ToCX1jh/OWTAbePSI2RQq
         UuvTn/Wt1mEJ6fud/Thzssj51s5sSKxTy6ewPkqFbOf/FdH2OJ5dQH25BDdR0DZ19zZN
         vGCnCMh/mXH4OydAgm1pnbJwxTh7oPrWM1F/i67Bf6HMht6Cgl2uW+40NPqdwxSOq7pG
         C/Fk7SjD3zSe7Hg+OBreSTPXocdloV7N34snjncFnK5hSlbZhLGzI4lhOTTSyZZUBnc6
         o+YyUzYh6i+lXrXktMkQnAT5tnMGYaZ3CHTTC7Bs8wbFB+/O5WfQw7aShzg7rKf+RRac
         8dVw==
X-Forwarded-Encrypted: i=1; AJvYcCVc1ZUH+GEW+twXaY1hlbRoLEUYVSV7CfzNzAYSpz1QUARrtWzBWHXyYFMBiZ/owm05L8KrEYng4g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgKa9CiI793eNL8ewDInTLdeP0LNwToAZEhrGrqbo1Disnabpq
	r8qIGPYuaa5yP89jqae7kc7q8cOWutgdpxycv1qgK2ctmfc9B6DBs+vslODJbmazj5OlGdfGGdV
	fVfhGC8UE8qfNGpBqK4TYTE3Tu5MVkhS30J0ELBM84ifobDmg9SlmyVks04MH
X-Gm-Gg: AY/fxX6lWoRqQK1TWc/oXUvdNOdUMIdZ7L8ZY2GtDB03oBD9nkhdELMnyYyuW9QekNk
	zUBI4llQYiM4gqsOV8o+ts0L2T80/O72MhpvGcT36tF4EzLVdHEaioCKbKEkzR5u9IZ0yiWwA8F
	4vXL9k5hyGCv4JJW/iZIfYmdCT2iJ5ecSKXTW/Skpaq37qN5vdi5dp/R337xW9NvnUVk0Ifan2z
	NBxOpNxAlim12UncyBXfvopFxPqIQKsCvahVo8DoivVeC/gdRca9q+UBc0kRRdIQ000by/r36po
	IOwPhUJ+bvpsAciAHmvDuDj9DcmiN+SDvJwJIqIZwvoLtZHQyFPXt8av+0NZnIshnzluGaLuy5B
	flhxCYCtRn20I8ZXy6fnByrEw0cjMK/8ia0uD0JrEeKxCGrpphWzCm0R/v8Gh3zknIW7v
X-Received: by 2002:a05:600c:4449:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-47a8f8c03e4mr184840335e9.9.1766003117128;
        Wed, 17 Dec 2025 12:25:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7mLfMCMEvY/d0ceJuMuGVm+p7i/RHEDp+58KhImUnarFbsKr3g+tGnz9jJLfG/gK9xplmqQ==
X-Received: by 2002:a05:600c:4449:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-47a8f8c03e4mr184840155e9.9.1766003116735;
        Wed, 17 Dec 2025 12:25:16 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43244934d6esm814631f8f.6.2025.12.17.12.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 12:25:16 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Iker Pedrosa <ikerpedrosam@gmail.com>, Michael Opdenacker
 <michael.opdenacker@rootcommit.com>
Cc: Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@gentoo.org>, Dan Carpenter
 <dan.carpenter@linaro.org>, Binbin Zhou <zhoubinbin@loongson.cn>,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
In-Reply-To: <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie>
 <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie>
 <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
Date: Wed, 17 Dec 2025 21:25:13 +0100
Message-ID: <87v7i4c0uu.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lvDBRnQxjD88kWTm7yICnhPRutejZjhjOxab9NLb27Q_1766003117
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Iker Pedrosa <ikerpedrosam@gmail.com> writes:

Hello Iker,

> Hi Michael,
>
> Based on the discussion and Javier's feedback, to make the SD card
> work properly, we need to patch the driver to implement the following:
>

Just one correction: it was Yao who gave that feedback, not me.

> Define a separate compatible string: the eMMC slot has a PHY, while
> SD/SDIO slots do not. We need to differentiate them to apply the
> correct reset logic (skipping PHY init for SD).
> Extend the pinctrl driver: support is needed for switching the SD
> voltage pins from 3.3V to 1.8V.
> Add tuning logic: this is required at least for SDR modes.
>

I think you are correct with all of these.

> If you don't mind, I'll start working on point #1. Feel free to choose
> any other task.
>
> I'll post a patch once I have it working.
>

As Micheal said, that would be great. Please let me know if I can help in
any way since I also have a board to test (Milk-V Jupiter with a MMC slot).

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

