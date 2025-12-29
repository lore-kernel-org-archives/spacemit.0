Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED32021B9C0
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767004023; cv=none; b=PRWE61/TGp2W7e0G0PkRJRvqzlIJ66FBAjATEzSnGT0DTUdeg+WD2HmHGPfVa5hYIUx2OPB65pLmdZHYo/O7M7IwDKPJTl/1Bnl9TDkOarrTdqyJRc7WDkZqFEqVOAXaV0ShOzf3hxSb3U+3RcGLnrC7zLWRJ1OETuJMO79LyBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767004023; c=relaxed/simple;
	bh=JIjIFvvwULJ/oMzAIPHMCSCZ9a/iOWZaiCvexFbAFT4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fuqYfEHBXUeJMPfjy1JB+pYz+3OL22zX6jQApsrhsqap66dzZiQELBltTs9cDd5z/S0OpOickZoLH7lCo+62YTTf7BXckmcbl769UJw+XiTWwwlhnYkEGRdjyAyrhyVMFfPshqZ7+UDCiz3KvbtP9KBxMrZAOYnEobwN5dgxJzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XOHIt+zy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XOHIt+zy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767004021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+gTURj67hUtoANoYmcW+tjm4QyZ/4RAo5MqihnzdnVQ=;
	b=XOHIt+zyQBDt27gFd+IidW0IyDY4uTwiv2nDPSqmih0KL9YUR3eTUt75VL8SgunSBJ5Yhr
	IRoipEEE/00gcXPKQ4LelYrk3QDDMCSMIITgos8rTAczGOALanUwhsSiVCnl93b07+4iTn
	BgwybS8Cq+ysv4s2eJm5/ZDuQHKU8l8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-YZTwKgu5MlKK1b_jZmv4nA-1; Mon, 29 Dec 2025 05:26:59 -0500
X-MC-Unique: YZTwKgu5MlKK1b_jZmv4nA-1
X-Mimecast-MFC-AGG-ID: YZTwKgu5MlKK1b_jZmv4nA_1767004019
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-477563a0c75so25193315e9.1
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 02:26:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767004018; x=1767608818;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+gTURj67hUtoANoYmcW+tjm4QyZ/4RAo5MqihnzdnVQ=;
        b=FlefPa8/wtyV07CqJ7rhyyneh13V8KC24/amkyWRIgm05au51o301mV5iDRW1qc8tR
         2GP+dqV6cdSttlBZeE8xTPiyG0EVOBEHmK1sUob0QX6vH9Ksi54fME7NX4dvb0ie55nE
         68pq1CLA7LZn81pAHxurSFajDl2IXw13sb7NHK6MFI8TfQtYRQKQPuqbPKUmr9hXg+Lg
         ZUcIR0UeH4Iq+/YXHpY49ni3t9uS1JmF1h8tWShKPdWgP0K5u1MmDAPrPSWVG8zjL60e
         DMA441EB3WyXwqZsTEJomtLENXJO99Vc0H53+UZ5nle1ynmcLm0tozACJ3w6x9OrYKTb
         C67A==
X-Forwarded-Encrypted: i=1; AJvYcCVacECtYwz4hC6dJqvIaPVrZRrRSsyL3U1p0j+Zryp+Kr+gjU68gtB4QxYq5iu4EvfxTrrz4pJGBA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyMqOOx+mJOVRDQkZHrWisomIJUzeV+K3QMx68siAPVul6SWLHS
	7lkZYKRKqCzitRuecBoGiCihexOGN1O/Uowf9I79jUUDKXqDBUBsDdkpz9ZhbW7wjE2dhjcmEA4
	sTW+qtzIglcPk1iCDRbAmXG43Viw46eOpKjKtaUjoE0s+n+FiPKdqt7ZXE5pGP0dfmde1
X-Gm-Gg: AY/fxX4mNiINVi0DDqL+zx+HI9a4mkoNMPwoDY6Db3JT062E1QdUc9Ch6+bPSgY3QNE
	GnosKA4dZm1SJekhrVz80MQ4XKwOFhbNUMdFJzOufM3nvaoMIGm78eKEF2kwiwDGDvZum3pvkpq
	mqNs4aYKLZj0TodaCXq0G3+KIZun+aTQcF/6xEZO/FH6OMcJv2tvuk0l+Kh3Ie3Q+d8xodnQ29O
	UWS7X++WSDDrp+Abku2ueD3rT8djv63V8ACktziqqbA5hxJlvqO3yzWzMnZSqFTFlDrwLXxW+E4
	MWZG0U5EH2lx2c2bhiMDha1kJTD+TjRhYk7VM6xxUrSLdz9wjQmPGXIvHbrt218G2bwV4rxo0eM
	XKiOdASn92QCpccM6NM+zYxeS4n/TycMuHzOr0EL6pMLXxB9EC5DlTbyEiGphbyXwEA8i
X-Received: by 2002:a05:600c:1d0b:b0:479:2a0b:180d with SMTP id 5b1f17b1804b1-47d1954a5f7mr342815065e9.11.1767004018150;
        Mon, 29 Dec 2025 02:26:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCLr8RQ/kQaLCzAKU4XinX/5NPXh7J4eFNQbJHL+v0sAPDycbmoLCRLQ+zzlU/e+HX1KBdsg==
X-Received: by 2002:a05:600c:1d0b:b0:479:2a0b:180d with SMTP id 5b1f17b1804b1-47d1954a5f7mr342814785e9.11.1767004017733;
        Mon, 29 Dec 2025 02:26:57 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d28bede16sm170253275e9.20.2025.12.29.02.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 02:26:56 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Alex Elder <elder@riscstar.com>, vkoul@kernel.org,
 neil.armstrong@linaro.org
Cc: dlan@gentoo.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, guodong@riscstar.com,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kernel test
 robot <lkp@intel.com>
Subject: Re: [PATCH] phy: Kconfig: spacemit: add COMMON_CLK dependency
In-Reply-To: <20251226173228.2020411-1-elder@riscstar.com>
References: <20251226173228.2020411-1-elder@riscstar.com>
Date: Mon, 29 Dec 2025 11:26:55 +0100
Message-ID: <87wm25fus0.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: x1zxXzDQ5XQckK1UCQ6QzY0ZkoaHLQ6N78g-dS4i1xw_1767004019
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Alex Elder <elder@riscstar.com> writes:

Hello Alex,

> The SpacemiT PCIe PHY driver depends on the common clock framework.
> Not specifying that led to a failure when doing a COMPILE_TEST build
> for the SPARC architecture.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202512251903.sTVZgg6c-lkp@intel.com/
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

