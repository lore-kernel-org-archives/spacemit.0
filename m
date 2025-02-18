Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCCC1E515
	for <spacemit@lists.linux.dev>; Tue, 18 Feb 2025 08:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739868442; cv=none; b=Y5nke9KissB5oVnXwS5oclQw4V5wuYGSifuknwsuHRiC7KJc5PtekcCf0SGVXkGkRLHsGUdSnQyphFwagSanzowC3VIOzU5ix+qGot8LQGgiVwz1Oy+gfm1901sZpqeWoUC2Gr/HcgpjnrZeeVKzGoB34QgWCkhNHXEO+c8Up2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739868442; c=relaxed/simple;
	bh=Ol6Iq9UCjeAQQT7E2W7DOZWLnUvYdgICD+RFi7UcYug=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PQwzqx6fzyxwHhOxwoX9pC71gAJj1hYacaJhBbag/aFeqbYWBpsuNEhxjudiKusSI6BH3RvRiOtcct7S0ohakjmbigjibEMwyJ0g84cgsoCRUcfaTm+QOSNcVYB9cV59p6NUdHjtsCwZZ5wDohZeZGivs/S9IslMZa7KuI+UcsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cKOP8y2d; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cKOP8y2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739868439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f0PPk91R2OjqODZtBQUNypPkAhjqPhzDO0Zl4X5trlM=;
	b=cKOP8y2dzy65mLAj8XHZ5XaWy8EkFpfu3oeKcUQzYeLzJCOF/kM23Lno81rJ4yJ5FHvAY2
	JXtMGa4y57a1cWz10CRdPfg13Jy1DHH2dOMDB9w2deeRTc9q4+UuvIWZdooYoKv3RJmQ3/
	Syee5ZyI8paFQQ8n68Vw8nIDEVgkzf8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-Q1-DUej7NXGFCP94yZa0QQ-1; Tue, 18 Feb 2025 03:47:18 -0500
X-MC-Unique: Q1-DUej7NXGFCP94yZa0QQ-1
X-Mimecast-MFC-AGG-ID: Q1-DUej7NXGFCP94yZa0QQ_1739868437
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38f36f03312so1252462f8f.3
        for <spacemit@lists.linux.dev>; Tue, 18 Feb 2025 00:47:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739868437; x=1740473237;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f0PPk91R2OjqODZtBQUNypPkAhjqPhzDO0Zl4X5trlM=;
        b=bo+4mUf8xITFBb/EEwPdU7I8dRchxx4EwBH+yspA1bNqeAQDiaMxVoPN7xKADCL5tL
         6dwfUxDoKe3XHkyueZms9+Ugz1UqOg7O37vxSXSW0UpVqeozdMOYGmJ2eTFLwy/iTLw2
         Mw93UbrFAb6XCGgJcrOtZKTBnO/wxFThGOKIkjsW/dK4MwpFP9YYZw0SgLnsQXwDhkU7
         xyBwE9cp5Xg5TcWwSJlTvgkkZRkvwy+Xe70B9n61OMDiIvkdeT9OBqduMwCAOssH8Zhb
         cTFl7awkx5fCG5Qe62dX6m/PCv66n33kHMT7H83o/zbpBF4xokVPFV+eOhlJc6RfYpIh
         f+dQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhuN+YGRccACx7o/8FNRcEmdRAwNpdZXa75KNs0WiO0nBmyld0AwTzmn1NV6INpIWeBpVX1JuRVw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzu+V6+kLZPFpSq/rSYrSzR6i4fFr86yjxdePjFD6MPjGaYW8oN
	vALtTGj3+9okXyqi11o4eTl6V2yHbKBeju5fjXN9mj4dHV1SnakbKFHr4cTegS5wfwUhBwIvcdY
	U+N+uYtvSsNdoUFzGtug83MUe9nsCw/mYdyDaEgz2FOlnsyvsMjllNY0t
X-Gm-Gg: ASbGncutgzPKP0aFYjsj6kOLRsEJpn/HbfpEv7q9u019tIuJ7z8UR48m7xnJUyVv3id
	YPw77oCkhotjCy6G2npI0E2Fk9KhNPD4tnskOtLP3YY0D9khKEN8w3MZ8i9lrYXpGRZeshfPaPK
	o+2cUDr+CWAj9lPCVsIkDZ06RNOxibH28hOM2HtE2NGNxNgcSJWyyCDe37q7d4yPB1ucjDWSl3h
	sh4tAkVdlhP6ajKR1UbqQDGCLKWCwx3wU6W/9/a9Rz+oKgyTi/PiCJ6SD3UyNy9o9/zyM/OmMWP
	etZc751VPcAzg3i7PuLV0wElgfQ//MYqu7T2eJ1xAZPaXf5jRwJ9IqqokUjMoy8=
X-Received: by 2002:a5d:6ac1:0:b0:38f:229a:b48 with SMTP id ffacd0b85a97d-38f33f34e0fmr10212216f8f.32.1739868437041;
        Tue, 18 Feb 2025 00:47:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFSbylPudXx7pB2i6xYLZO/0No55k7fxSLecS40C+YqWkkI3E7XGgL5gcPSu1DOJPV7vKQsoQ==
X-Received: by 2002:a5d:6ac1:0:b0:38f:229a:b48 with SMTP id ffacd0b85a97d-38f33f34e0fmr10212191f8f.32.1739868436746;
        Tue, 18 Feb 2025 00:47:16 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4398a8007easm36991295e9.21.2025.02.18.00.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 00:47:15 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>
Cc: Alex Elder <elder@kernel.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>, Alex
 Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH v3] pinctrl: spacemit: enable config option
In-Reply-To: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
References: <20250218-k1-pinctrl-option-v3-1-36e031e0da1b@gentoo.org>
Date: Tue, 18 Feb 2025 09:47:14 +0100
Message-ID: <874j0rr65p.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AXLOdsAFN_3NxdtxrAW2PpsbNF2OLChckuhl9F7-iT4_1739868437
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Yixun Lan <dlan@gentoo.org> writes:

> Pinctrl is an essential driver for SpacemiT's SoC,
> The uart driver requires it, same as sd card driver,
> so let's enable it by default for this SoC.
>
> The CONFIG_PINCTRL_SPACEMIT_K1 isn't enabled when using
> 'make defconfig' to select kernel configuration options.
> This result in a broken uart driver where fail at probe()
> stage due to no pins found.
>
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC")
> Reported-by: Alex Elder <elder@kernel.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
> This should fix problem that CONFIG_PINCTRL_SPACEMIT_K1 is not enabled
> when using make defconfig, thus fail to initilize uart driver which requst
> pins during probe stage.
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Tested-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

