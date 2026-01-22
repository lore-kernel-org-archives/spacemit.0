Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A30B3921FE
	for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 08:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769069216; cv=none; b=V3808Ej5WviXejNScd0KlljfFKtJUFpfCqCzRh21gnal3u83v8Qh12b/tIpy8gA2syaeGRizoBj0LcueTW4kkVodE9/FXg9KuBWHBfj7hzsilEOOjYgBggVSrj5k2T0Wkf3oIFdElRppuVfqxbEMk7UvNYePNih2kbpV495i+Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769069216; c=relaxed/simple;
	bh=UN81btdLXwLmy+i3FQsqe41ADn+eiw3IDaM94IgibCQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NFJHs0uYl5sqg16k6fhoYIG8wphM0xiPYk7Yx3QfxIWE6x9IPlBg8j9GR8H2Fh7I/NVftH5r+2NBZU2spKAYziAnsRp82sqnVlYwDfUsisaTHFC6z6KM8uxpupnufIKS0bIWss1nL/jDUPg8TuGWj8CSlrZb5EIKiaeOkVdKiWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AAk52q7f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AAk52q7f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1769069213;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xnAUpn2svZoy/oq95lU8MjW2YyOALbOwRLuDG6KCbUY=;
	b=AAk52q7fwkTSDGQk/U7t8SP26AqYSXLy9dKJB1x6zEU1hFIgb85fEeI4cmGEOQS4dyMuPM
	qqPBt51EGk2s1OgJCWTSv3txSAG7PH+E0PzosgEMrmdGzgGUzNma63dTR1S9fHBEmYORqZ
	4ebZiAxVmmkWlaLSWH0q6ULU74HXocs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-gbE9hSmUPtykMLgHRNXFVw-1; Thu, 22 Jan 2026 03:06:51 -0500
X-MC-Unique: gbE9hSmUPtykMLgHRNXFVw-1
X-Mimecast-MFC-AGG-ID: gbE9hSmUPtykMLgHRNXFVw_1769069210
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-47d5bd981c8so5023855e9.0
        for <spacemit@lists.linux.dev>; Thu, 22 Jan 2026 00:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769069210; x=1769674010;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnAUpn2svZoy/oq95lU8MjW2YyOALbOwRLuDG6KCbUY=;
        b=lcIbTvH0s29VZXb0gUYEEoAGI3zLfrPAB0ECkxD62ASP2RdSSQ/KaLAn8CRb0zLrWv
         nm8Q/aPAD96NJT3jHfXgwSv198PTrIV7ab+a5JvkEz72BWDWfUi7h3wW9OdUDyXJFpSk
         +Zg9rUo7Z1idm3nWe4nTdr7fjWBfrwK+HA22BU4AcMdlMOrMPup9yOmM/nN7R9HoiIEB
         og4NbqBGxOrL9L+LCgJL38f+0C9pzq37+XlO4GIYvmlAux+CCHuvAG0YWCOJEEpW5re3
         CCrc3eit1keciK2B6eX7Eb2b1F5QZ1lITkhZUYyMILSwiMa/6HManVoHGMVLrp47w8Uh
         E3Gw==
X-Forwarded-Encrypted: i=1; AJvYcCU3KRH4lxRuniTiqs8q7xQZAFYHRMPmh9El2acLUkwZaos1wqpLJznw2QyIJ4EauCeimu1+77S7DA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBOiBSoX77WYwvgLcztD7BL2O4Bh3jKP5zSVI8Fk5u1rJSi7yy
	0YBuCGy+mBbuOdGqkzHGNVHVuOedgGTJ/uVwxTsHoNf8whL9ydkSsj53PonALzQk/JwuLhYKfAz
	h5CIwAvgJd/tNMfTlneqeSaANjKrCv897rDYIlHrLXqQhUonAT3KvURYl4ELBPQeHmSfv
X-Gm-Gg: AZuq6aJ1qq9A9wPrL5B7AzFwCDJyjTGMB8Dopgn1AXu05DQrBD9tZuJI/GwJl+ZzFch
	eD9drnw3/kTxuZr+tieE2XM2CF5ERmDsnt5RznJTTM6hqll8F463PoD60ZmOFsEdIuU6zsqJsR2
	0D4b85yZftYVDnep+YVwIPF3DoMShUMmmAzSqP7NLXTAowc/3pj1JOpzFS0JZJrwUOIhZ4lXSB5
	2iRxPwTYc8SpR4dQTwvDKrDqNBaZBtWtz3l1t+q7vlWHEuq9InChR0ZyRZLVHbfzCzTRZxKFJ7d
	rMANoCg/q55IM3JL2HCbyvuLAL/ABtxarsRGF+fhVl8l/FcDNqDFJ/mKmirh2ftSg5J7ql4J79Y
	FCHcNOBe2v2uxuBmr1zfU080zFJAYf8MQPphFvPta3QLyyjKJQOdYIhnTQF/zhao27nYh
X-Received: by 2002:a05:600c:46ce:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-4801eb0efe0mr306255015e9.31.1769069209708;
        Thu, 22 Jan 2026 00:06:49 -0800 (PST)
X-Received: by 2002:a05:600c:46ce:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-4801eb0efe0mr306254515e9.31.1769069209274;
        Thu, 22 Jan 2026 00:06:49 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48042c38063sm44525215e9.12.2026.01.22.00.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 00:06:48 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, Troy
 Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Yixun Lan <dlan@kernel.org>, Alex Elder <elder@riscstar.com>,
 linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH] i2c: spacemit: drop IRQF_ONESHOT flag from IRQ request
In-Reply-To: <20260122-05-k1-i2c-irq-v1-1-9b8d94bbcd22@kernel.org>
References: <20260122-05-k1-i2c-irq-v1-1-9b8d94bbcd22@kernel.org>
Date: Thu, 22 Jan 2026 09:06:47 +0100
Message-ID: <87tswedqaw.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: akeUbyv8vEQDpY8c5FVMUW4K4aCKbwPF2NW2EVaE70A_1769069210
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Yixun Lan <dlan@kernel.org> writes:

> In commit aef30c8d569c ("genirq: Warn about using IRQF_ONESHOT without a
> threaded handler")[1], it will check IRQF_ONESHOT flag in IRQ request,
> and gives a warning if there is no threaded handler. Drop this flag to
> fix this warning.
>
> Link: https://lore.kernel.org/r/20260112134013.eQWyReHR@linutronix.de/ [1]
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

