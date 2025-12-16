Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FF93370EC
	for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 08:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765875501; cv=none; b=TTfkxwQUS+38E2jpxTATtiEy+QpDOas4yjD735Te+rRu0KvyeZPnWlxcRcsEB4JE4Wo+8DgZLgV778lCvBI+CYYT4HLZxG1pBzNzE+/hhm/pG3A0Q2NbY/2Neh0sHhYT/jEQFL4w/pbkDZSN8TGHjJSrwBVsJ3Ngc2Q94vihVUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765875501; c=relaxed/simple;
	bh=M7agqiAreer+Owk+KL+RN4Lyl/tUWL2W531EruT+D5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N+spL8X/gXS4gJl6TW9iRpDm8LqUuwanEMYdTh3ZVbD3TO3oaM1Snl1IAPgOCI4FqLnGiXWVxLx8x+b2RCc2HX2CWq8YpxD8B/3q25l3wBGTkGmgvGDyhvr3o6aKVqmWfJ5Jv5oEXcwZubxkqSpYJdKuvPcK0InLqxHEJIfsvJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KjvyscRN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KjvyscRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765875499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=smIh+5mEfwRp/VCJn7PI/sDG6WFCEcopmj3bu7mRfhk=;
	b=KjvyscRNeQzftja3rDczyMX0rEVFdQvLusWoIYFB+bOwE+cEkEuj/o19mdR09EqDIt0y/0
	4kXY2I+qD/WWY0U/Adu/zgQemNRLcLMFkIRxFOuMeSRw00xe+06pGsKyVBPg6VIltApdpt
	uxN1bMwqrKGW2egUrz6g/QWdmpvLX3g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-hBjG3rs9P22IEHfHH0UVzw-1; Tue, 16 Dec 2025 03:58:18 -0500
X-MC-Unique: hBjG3rs9P22IEHfHH0UVzw-1
X-Mimecast-MFC-AGG-ID: hBjG3rs9P22IEHfHH0UVzw_1765875497
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-47777158a85so50283355e9.3
        for <spacemit@lists.linux.dev>; Tue, 16 Dec 2025 00:58:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765875496; x=1766480296;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smIh+5mEfwRp/VCJn7PI/sDG6WFCEcopmj3bu7mRfhk=;
        b=tgMI0W+hjJraP6pIbQmvPApaW6WI2s2HsNoDRzc9a4LV4xmX492dPkh5mY0sWHL8ku
         tYV6tEYRaCtWKLl6ogSm7TwEjhyxA+MmHz4xLZ3Dws0Clf3ZALlDEL+inFeqHRZIW5c1
         UK1zT3rZOMiRtiCkQKjf5bMhY/L9MDSr7nLEzyepWi2ipowJDrBoM3h2N0Kymyxy0HbX
         60xTrI5WXgyX5Tj+oPRgK5Tqigr8QUeN+XTjEHtoJGkP5Zvh8yxj0VfQmrayC9Vjuv8r
         JVAQ6n2cvIEUwZJ1hmwamuk2ypGBESQgNtX8utJ93yGdhlrpDaOR2deuaU25u2XrJFbh
         tyYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGuOfjRKASF57NWhlGe/nfrKs33wzA1RWuxkntQYGTMxS0GDmJyctirVZg2N7JZX5Ht+y5tO0ZKQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzkDR0iJOnI5Qelnh70sGMhsak/r1xy54Q8UjOqruP7Lsb64rlp
	2wDW/bgVnn3QhmkklY1Ily5AzWJA0XNkq1zDKAFr/9OWXu2zW7qF2U9vOd41+L2GZMAIUJAIF9C
	JHkCdT1n2a808Z1PZN5r1n1ecx1bjz/uoTS4Gl+MqGv0Ah1h0fao/Cl0bjFEC8QxdSuEhpDeReg
	==
X-Gm-Gg: AY/fxX7KyJLGfr26NXz2KPDwA2j2VbFYperhyD3R4RRsO7cSC5+ooEnSe3CFw7PDs4C
	TkK/Ao8BXYEPBsGRlxQgJ9zDnOoC230J+jr12KhJltHsTGkSwBgm4wvnNT8qGRjgEx0Dqcp0JC3
	hVtMcZQOBuLCdlo3i9iofeguCMm1E2ouESOTbImnbBpli+wWGGFjvordQzSMdS0Jd2e6rNL0FoH
	+QJFFvG8lejhUiziZSMlnd9s2INV78ks0qx2/GnN2AITGdnuaGaZxo3/x11mCBAC7CWbWdPVy22
	dc+7Ywvxp0HizwobAp8w7Sb2tYcWI3fCsGEDNGy9hzCj2BdcqtvKkgRw1Fz/ceuGEvx2TJwfS+/
	tTGndTH58XQzp5kXb+ATk/dzdyVJtttt4czKrSE0N5ccEzt44UEYFB7M0LnfbXvsNrEro
X-Received: by 2002:a05:600c:4e09:b0:477:9976:9e1a with SMTP id 5b1f17b1804b1-47a8f89bc6cmr149957665e9.6.1765875496506;
        Tue, 16 Dec 2025 00:58:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjWkmMYEf67W1YCZcgSloFqkbCuOswTF4JodEbbnfpJ+BFJ/SH99M+jkvcimr1IpbsGAY3/w==
X-Received: by 2002:a05:600c:4e09:b0:477:9976:9e1a with SMTP id 5b1f17b1804b1-47a8f89bc6cmr149957445e9.6.1765875496061;
        Tue, 16 Dec 2025 00:58:16 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43009dfe5b3sm22487329f8f.39.2025.12.16.00.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 00:58:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>, Yixun Lan
 <dlan@gentoo.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, Binbin Zhou
 <zhoubinbin@loongson.cn>, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Michael Opdenacker
 <michael.opdenacker@rootcommit.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
In-Reply-To: <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
Date: Tue, 16 Dec 2025 09:58:14 +0100
Message-ID: <87cy4els61.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SCaykLMKyTFxU1VAd7SBmtTj5Pw0Y4SsVT4dtOoP9eo_1765875497
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Michael Opdenacker <michael.opdenacker@rootcommit.com> writes:

Hello Michael,

> The OrangePi RV2 board exposes i2c2 and i2c8 buses
> from the Spacemit K1 SoC.
>
> This declares devices present on such buses, in particular
> the at24 eeprom to store MAC addresses and the regulators
> attached to the PMIC on i2c8.
>

As Yao explained, there is still work needed to make the MMC work on K1
based boards. I also tried the same on my Milk-V Jupiter and found issues.

I believe though that this patch has merits on its own and could land
regardless of the MMC support. That's why I also posted a similar change
for the Milk-V Jupiter board:

https://lore.kernel.org/lkml/20251206134532.1741648-1-javierm@redhat.com/

My changes are identical to the Banana Pi BPI-F3 and I see yours too, so
it seems all these boards are based on a K1 SoC reference design.

> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 166 +++++++++++++++++++++++
>  1 file changed, 166 insertions(+)
>

Personally, I would split the changes in separate patches as I did on my
series. But I guess it is also OK to have it as a single patch as you did:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

