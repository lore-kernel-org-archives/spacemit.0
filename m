Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D264B26E70E
	for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 09:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767001692; cv=none; b=qpwjuqfpN+Em73hxqmzQOmpqIS4yy6qt1pYFDy52S+U/ev0cVWcIxnmmLFj0pZTmgJGqJNuEKSfQ6Aiyyov936vTubez/2kFBQwEV6lymMn/vRU+C4ylD/GgV6DEIyw2WLylgoAs0cQNPiduq6OCVyxsEAzQyPkwz4mWyFEz/bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767001692; c=relaxed/simple;
	bh=X7tl44V3WL7cO7gk/CByTptZ+spzMkyKgxlBDoZ4nbg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TexXWkBjUVzlfQtPOR+hw2xuJX49uOed5v2uA/bChRNegwwkT7CL8FmvkVYEbttgmbjhuDJyMqGZYr2dyBkq2VM9XqIsubNEi//O6OkUBEia8z4/H4rutdYGtOkEht5WQKbydrcAVFISROg5x2b84AyluwT6Zbr1vnKaomuWaUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MGrgf27z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MGrgf27z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767001688;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RnoxkXU/GI8KdYqeGZPuNP5j74RbxRLg0HQulbL1vDI=;
	b=MGrgf27ztpx2htKYGkcWWzc5wH30Ss8xBgij65XGNKO29y43+bDK/qGJQXc0Wo90+5nl9K
	xg2V0TmuL2nHYyX4hz8lQlA88HeOPqcKcDijUoipOq3gQ3eWyVx8IgmNSR1j9nuRGyW7ne
	SmcZPNvry9nHQRTh8xWqay2jxI86oeg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-O_36bZ_dOBWPzrsuy2hZew-1; Mon, 29 Dec 2025 04:48:07 -0500
X-MC-Unique: O_36bZ_dOBWPzrsuy2hZew-1
X-Mimecast-MFC-AGG-ID: O_36bZ_dOBWPzrsuy2hZew_1767001686
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47d5c7a2f5dso274715e9.2
        for <spacemit@lists.linux.dev>; Mon, 29 Dec 2025 01:48:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767001686; x=1767606486;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RnoxkXU/GI8KdYqeGZPuNP5j74RbxRLg0HQulbL1vDI=;
        b=LIT3L9R9tZxmmrIIhCypl6asX8UKq2HyCE9ih0xeabmo/bhh7ZwlvAliqXKddjzF2c
         K0npH/6tXZ29bp47oxSktewndJXemMRC2LmhXcuz1g8y2OvTas9Hw1MpIemB2falWbIT
         N42kwHM/TN2Wbi38UNLxhvMx9y4TscPF5j9p5qyRZFhSgqsGsZk/0jajN7CI1sV7FOMK
         a4RGJX+7Bx80pubxq/NT19ggJCeDmEbk8CU5hch+DAN3BFmqh4d1jrHCEU6NxoAI5OiT
         QlJjb6a2pLY+KvS+oOEVUBc00QYhLRuiiFxRrjUjLczg7ZFbB1suF5c4jBZLsLP+98pv
         R5+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYQ8ar/aY8H/b74bdgBQZnZIkFmC4gxQPqgIVL6WJgpP4bf7gCbcihK8c9NWeJUnZGTylyZiktUg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGBMws6XGvpUJQZ/TEs+cvJKQH1/3f9BhUkPdM0JGGfPU03Jmj
	7uQXvT5MCaZj0ecD8d4o03wzr3zt3AxDludqsGPMRdOAWeHA9pWmyElyrhoanSlJZJnCIyDc4zJ
	7VXEqBiuDkrTse7vc8NtU8PUBp7QWwkl4g9i1Gp2Me8fKC2TOQAeyN21RXfCl
X-Gm-Gg: AY/fxX6VRCJ79jfEJoXSrBCN9rcyu7tkjkbTAxAiYvkiF8Riiqs63k9WercL1ATIA0E
	CJKyYZ1aZM8B2y4nT6lcy4wSiS5SmnNyaurkOoDwAATND1IKw/Vq8ML3ED4QQ6IaJW1OkAxEw2+
	xZOhBuUGRglwuw47UP91g2rsTdUa0uZtQoutmdxj/6dHUKXeKrIR+UZzs2OxuqCfC20XStQkk4H
	WmwWI+tvp5e96pwx2NgO9rVwgQY0xAbSkGlKr/vThR+gHniidq4GiT4mDLbnjgReMfFqlpqDcY0
	2skzwFRxzHkHznrTbXq6BxKgrB4YiEcZ8fZFZpQWSZI5kOurlulEJV0GvCZd55SgKG2xpbefFlG
	MHvLls2zF8HGzAxaZzi6vC6q89pU+1aTLbddDQmj6SI8VVDccLFXz3iDAM/3dIQ2YMcVP
X-Received: by 2002:a05:600c:4e49:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-47d195911b8mr306757825e9.30.1767001685808;
        Mon, 29 Dec 2025 01:48:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzfoPDCziY2Ru4fP0I+7aTnAKnoHe3exw4U31W/SkLy53MoLHcz6raQVV4UNwNgdpcefpRiQ==
X-Received: by 2002:a05:600c:4e49:b0:471:13dd:bae7 with SMTP id 5b1f17b1804b1-47d195911b8mr306757565e9.30.1767001685444;
        Mon, 29 Dec 2025 01:48:05 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d19362345sm528501075e9.6.2025.12.29.01.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 01:48:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Yixun Lan <dlan@gentoo.org>, Ulf Hansson <ulf.hansson@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Yixun Lan
 <dlan@gentoo.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: mmc: spacemit,sdhci: add reset support
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-1-5b8248cfc522@gentoo.org>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
 <20251223-07-k1-sdhci-reset-v2-1-5b8248cfc522@gentoo.org>
Date: Mon, 29 Dec 2025 10:48:03 +0100
Message-ID: <87bjjhhb58.fsf@ocarina.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Dxg_kAfoM5V064Pm8Fp7QIFv1trm4RrAzTVo_ouFLSc_1767001686
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Yixun Lan <dlan@gentoo.org> writes:

> The SpacemiT SDHCI controller has two reset lines, one connect to AXI bus
> which shared by all controllers, while another one connect to individual
> controller separately.
>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

