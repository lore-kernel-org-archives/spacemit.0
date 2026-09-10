Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1904A0132
	for <spacemit@lists.linux.dev>; Thu, 10 Sep 2026 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049388; cv=none; b=Cjpqvb0GeZ+TyN7Sc0SzZS/N8pCdSDXKDhhRlWbO0bi3IrCG6EYCawf1xGIKv3gtbT8L4i8g0yNR23gWV1p2ltzqfj30J1gj1z1nSkITGkc7qTTG/YeAmd8cJaTtYnYoGlSN8mOcFVmbsOPXNjxvJeUHDW/noVbf+hh1/DwBuv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049388; c=relaxed/simple;
	bh=flauk2JAfyKEUjs5pcpTgaXIkDJP3xfV0YHLjD7hMCY=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ByulP5gR1xzztodF5YiE01KutDT8te1I6f3JYKix3hJ3IVSdKHEdix1V1AZVl2tui/sEhhINidi/3/uU3TWZBixw6jgpZk+HWVSZKAG8aQ9x7aF8++02at7idNSX/S78wY9K1TwurS/gIfXRUR6dkEov9erLJIXsuRDwdPwS350=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGgVqqw0; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGgVqqw0"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-85469e2254dso546310b3a.1
        for <spacemit@lists.linux.dev>; Thu, 10 Sep 2026 07:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789049385; x=1789654185; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=flauk2JAfyKEUjs5pcpTgaXIkDJP3xfV0YHLjD7hMCY=;
        b=aGgVqqw0HmQxAboDvcyTxIJIhC+/uKjdiTLerhMf2mKBhCokmBg4n2656IbkmSpuyX
         wP6Bh5mrzEE2bQ/BE/+MCAjHBPBdxy1PV4HjBPVw49RURzTypgneRMyaaUURQKtXc8Uq
         TmB9FgxofDHm3qBh5fFqlQR+/CuxGj3xKxmpaDb3axda0hUi4snVnP12tVUhygUCyAKM
         FAzgpUnZPXrCWyHutMttSCcFYvfV8KZxQmUOUlbVFqnpuYqgcRvcWw0pYj9TBoZiNawu
         oQWQ5XHk0D1z2msZZgjzNxzdOzBTi3Iyki8NB77mXWCTEGpz/atd4FKr0vHtOvba247M
         i3WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789049385; x=1789654185;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=flauk2JAfyKEUjs5pcpTgaXIkDJP3xfV0YHLjD7hMCY=;
        b=deRk6k2lz1FsBWlQUoPAxlrRnVQSQf1VXL3XmrMejeixhvOU9vwbyQmhtqIOoB3hEs
         3Jh6uoelWxEI8VElBFqK00ABQRvja1AzDsFoLVIgL8yFEKkr5kQHu9nTNh1dsQiKXHn0
         sX8S+y566sMDSQmxjwud0SoDqP6TaYp9vorDu34gtGGAdW4RCjg15YguLQq79xcXBTAd
         MeSMs1WQc7LHJHX39rzvDmMVqhP2f9+XeKoDRRis83cF6xC/oAPPzW+F8f9qfDrR9gsQ
         LOCXYNvmIVpg0FHMlEZHgMaBvo0H5IWqA1NjiOxCckbjn18ofywHLzI1M7Euru1uwa/w
         EaKA==
X-Forwarded-Encrypted: i=1; AKwUvBxuAIU7Bbz0Y+alboBuIh3NYEGtJBHxoc5tfrK0EQrFtjTCgjGEbKzuZeMN4aqxGPkFRSXkeQg0Ng==@lists.linux.dev
X-Gm-Message-State: AFuF++mB4DEbr5+TDwKGsPUXBsjyhvqVhCrLlfSkSAZmOuX1XMvKcbRp
	C1S+d25aipLvZoQLcjN75XadugptajbK2PmjXw2/4QloAtI8La0LQy4g
X-Gm-Gg: AYBFou25BVALZUaMI4miz4X/IWbtbN4FX/CQj3LnD+gUeqB0rIr/gpI5T28NSfGFTxX
	pqC3USwddbzAy1yfuKxhIOF4I0NvuBzp4ci77AtRLY1sAtFAxMBbm56zA1lZnoGiGnoBiq0bjSv
	Ixa47p1AmgSMKLCcR3lOIil/xspcj3t+31n1rpWsdaTzCHtNiusZb+iXu435obalOwrZIqISvH4
	4zW917fFLe02brGBt6JSyh4xa0GbwKAPnVh/HQkEq/4dCTPuHxM0rkRxTtq86HEALXl0kR6spSf
	zvVuQZIDcNZ7uXE/41zn0zry/WnXP4n4nFZ/3jYG0kYkYYaHOP+d3I8esBDeoO+RU8m9eVMOPNl
	e6QGt0qLZxUXhQ1VMV6+9Pa3MOv+x77OKECG4rXjFDG35NHUvta2tkBid27X2voV3PpTPOBALDS
	gGNTLZPn9Gk5eKLPkw6v2dy51ywO0R9Whp/CPvpqlRTX6giO4sWRN/+A==
X-Received: by 2002:a05:6a00:1807:b0:869:44c3:c24b with SMTP id d2e1a72fcca58-869ad9ba9d8mr3437552b3a.0.1789049384734;
        Thu, 10 Sep 2026 07:09:44 -0700 (PDT)
Received: from localhost ([2a12:a305:4::30fb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86153f417f2sm8006059b3a.58.2026.09.10.07.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:09:43 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:09:37 -0400
Message-ID: <43ce274d284a4f94815ec25f5ca0604f.docular.xu@gmail.com>
From: Guodong Xu <docular.xu@gmail.com>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Yixun Lan <dlan@kernel.org>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Alex Elder <elder@riscstar.com>
Subject:
 Re: [PATCH v2] MAINTAINERS: add entry for SpacemiT reset controller driver
In-Reply-To: <my7qwtgrgph43hjxwmjm5hkeuxltlqjntnj5zdo7xqlrfrlffx@fp4mt7phdor4>
References:
 <20260603-b4-spacemit-reset-maintainers-v2-1-db0716d43a7f@gmail.com>
 <62e1781e127176294088cee9c120b3173359ec4b.camel@pengutronix.de>
 <my7qwtgrgph43hjxwmjm5hkeuxltlqjntnj5zdo7xqlrfrlffx@fp4mt7phdor4>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Philipp,

On 2026-08-07 19:51, Guodong Xu wrote:
> On 2026-06-03 09:34, Philipp Zabel wrote:
> [ ... ]
> >Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
>
> Gentle ping. All tags on this one are collected:
>
> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Yixun Lan <dlan@kernel.org>
> Acked-by: Alex Elder <elder@riscstar.com>
>
> Could you take it through the reset tree when convenient?

Second ping. This is a MAINTAINERS-only change and carries your
Acked-by, plus Reviewed-by from Yixun and Acked-by from Alex.

If it is easier for you, I'd like to ask Yixun whether it could go
through the SpacemiT SoC tree instead. Unless you object, I'd suggest
we go that way if it has not been picked up by 2026-09-17.

Guodong
