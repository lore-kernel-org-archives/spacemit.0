Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C11E284880
	for <spacemit@lists.linux.dev>; Mon, 16 Feb 2026 22:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771279981; cv=none; b=LObaSR5Yl/t2ePwTa9W7iYTzXi74wJZD4VSwFDtsvXhNKSv4ZYRk0e0x2u8q08qMu3ajf0xA9oGJZdzIexkeuJ62vZBchANybxJo66GBs4MnwWE2+bK49HlqQSGjFUKoiaYVqtKS14qNfuK1HUraHxXQxGoFOJJYOn2H1ULgdu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771279981; c=relaxed/simple;
	bh=0VqKr8goWPODq3M3NGIHGra5z7V21D7yDX4j/Pksnf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ra8LyV5YzHQL/8NDa+dnVwc4FwS+aZiRtRQftMder4rmI6qXSEDdVXEYARxQ72i5Ti+HhrKXlu7Bh1aVDfwh92QdtYo+KUaTejs+a/Ln0+UvA66q31URvJzOFs003OWwHyCJ77P+vw1NSO5eGCRe0/eK0au04qIABOkkNT2g4JI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mmBEUOi5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mmBEUOi5"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4806b8fca44so5149175e9.0
        for <spacemit@lists.linux.dev>; Mon, 16 Feb 2026 14:12:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771279977; x=1771884777; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=15IPpReMOhWnQxE4O6qiiwyShkxCXyUxYB3ay6FehAg=;
        b=mmBEUOi5AwBvgr5KSn22DtQwEBx9NtnXtQb5VRUESqAiAF9h8Pg5LvST0kR8S3p9Rv
         +Kmkdhnut75HxYS28ioxObh6C5V5Gp7FOXz1gnSfs2MV+VyHeblRGAKwLxslcBu6e1eU
         kxIHqjzHctjWKu562pL1m9NnWSQAhr4WZy75sbLLKZ+IpAS3eMdloXXCjyj+Cscr7ACD
         jgYoPvCtWvySSNmJN6zgXm6EERJj/yjtR9GCadJxabDUZpr069bhDAGj2O7oxISQnd6m
         drXgBKvFKDNhxlse2BVOdQAWfZYkJ/LvRszmxa/hr2iItgQkZ4164dwAL2JPlay/lleq
         g3HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771279977; x=1771884777;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=15IPpReMOhWnQxE4O6qiiwyShkxCXyUxYB3ay6FehAg=;
        b=CHxucRnnU7CZTCBB50iOPW7iGFf/4lHlYTG+RYQaosJPnbAq/xLUIYo6KVZTAJmONP
         HP3zrUz0R8WYgWHt9jBPcDeVJ6Nse6fl7lTyBPgJhbAfDBsr6SqvKxkOMJ47MPWEy/pP
         wRPHBtLv70xolj88L8TVM3W94payqHBvfD+1C1nLoLd2o32CWOMuuMo2kU5B9Cbp20SP
         KcbOfqN82Fr2URS48rp54hwWBdn1Sl6X9hS3tyAzRx8YFe2TgHk0eXGTOlWNCcQcZQm1
         pIjoZzqCeGnZ3BBxIeiq5ohxjDFqW2ah+oHrYBbBRjhQfEVkm/Zfr90XwPYm7siVQpGP
         RAVA==
X-Forwarded-Encrypted: i=1; AJvYcCXmjLoL7RO3koRDP4wiBCMYiGWFzFxC8P+BASGLp4BmoOaCqsv6ag3QzF8PvgXRTZiIAn17w40rKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNIsZrlqVtXvlJEuy/FodJEwK2MkE+K3YsomDL1kekBdqLY1Y+
	hxzbdumQDTjeopyEdaUQ+U84cF5t1nFQhQ69GfnMPIp8Bf/MN8+sx1SX
X-Gm-Gg: AZuq6aLvJ73kNjO1gElXQ1oI7B0jc2GTA21RKHiftV6tfxLyH6iHS4Km3OpkOFJKf2G
	FQRXCOWIdRPc61guZAIZpvbWH2/njhzqadnlcfNB1sweU3G2CpLCq5woaYNqSprq/W7gmoxj6SH
	eUzzzZ7LgkwEqjgFdhsrxrY+ZVjr5kTCK/8hvYjxrYuZxG2pzW89jOfTJOK2KXdDOOO/bjWKBmI
	RAW6P/xxc7bF1ePCwOH55ooFl3f5D5ZhS0UfnuC2W5miNFBmJCq/pSctYywMAR0qfMsXPAJ633+
	bpwlAj9/mA8HLhrwO4ACfFrVktxFvrSMDqIAAPaJRrkFMIzWEU5WbuKXHeArxRcxLBK+tRz2nju
	DccKNDIuTk1c2J5MyhO/zrK8moV5+2kGGXOS5ICwMMt5lP+ZHQeSakAiLSFFy+m6DrDJIUaABeZ
	TMGL8Sw4lgkbmM8zU=
X-Received: by 2002:a05:600d:3:b0:483:8f10:4bc5 with SMTP id 5b1f17b1804b1-4838f104bfbmr11005335e9.4.1771279976748;
        Mon, 16 Feb 2026 14:12:56 -0800 (PST)
Received: from skbuf ([2a02:2f04:d501:d900:ac3e:d4d0:5059:7047])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835dd0e327sm460068605e9.14.2026.02.16.14.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 14:12:56 -0800 (PST)
Date: Tue, 17 Feb 2026 00:12:54 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Yixun Lan <dlan@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ze Huang <huang.ze@linux.dev>,
	Junzhong Pan <panjunzhong@linux.spacemit.com>,
	spacemit@lists.linux.dev, linux-phy@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy: k1-usb: add disconnect function support
Message-ID: <20260216221254.vmd6jtpl7r4rtob5@skbuf>
References: <20260216152653.25244-1-dlan@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260216152653.25244-1-dlan@kernel.org>

On Mon, Feb 16, 2026 at 11:26:53PM +0800, Yixun Lan wrote:
> A disconnect status BIT of USB2 PHY need to be cleared, otherwise
> it will fail to work properly during next connection when devices
> connect to roothub directly.
> 
> Fixes: fe4bc1a08638 ("phy: spacemit: support K1 USB2.0 PHY controller")
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
> To: Vinod Koul <vkoul@kernel.org>
> To: Neil Armstrong <neil.armstrong@linaro.org>
> To: Ze Huang <huang.ze@linux.dev>
> Cc: Vladimir Oltean <olteanv@gmail.com>
> Cc: Junzhong Pan <panjunzhong@linux.spacemit.com>
> Cc: spacemit@lists.linux.dev
> Cc: linux-phy@lists.infradead.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> 
> Change in v3:
>  - split from v2 as bug fix
>  - fix alignment to open parenthesis
>  - http://lore.kernel.org/r/20260216090112.n5jjpui3luqsybb5@skbuf
>  - Link to v2: https://lore.kernel.org/r/20260214-11-k3-usb2-phy-v2-0-6ed31e031ab4@kernel.org
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
