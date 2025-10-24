Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF73C31B132
	for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 14:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761315235; cv=none; b=q4Vo0v+b170KQTzdePUikMrVw950SQqeshMQiPYOlm6CH520JQwVry3md0ggkxJ1bj1VqQfl01IbAmhdkKuPgNzeWX2IysaCeFYktDW07dYKxQLHugbY2UBhfbA2sxePJddIbI0UC+HKTTJt3X6/lyy27yrpFLdUbk1xrx34LtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761315235; c=relaxed/simple;
	bh=UMc4DAdZ3wELgwJc3P0/USAY01EMC3U9Jpr3hVyWTuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTCvL+X8KcIrWWv7YYZz2ro6VV8PBFwPaSGle4nu/zY3A6a2x2g7KwajaPC6qalm7krisAPQDKAc6Uc6ezlQZ1jgZ4Qb5maqfxAaHa389reD2fe4iw3FlmwqszU5gO5Mt97sw2NjuZdSe3xdT1Zu0Ik1e81Xql1Gmry/cnQVAzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gTp4bUtT; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gTp4bUtT"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-428564f8d16so1165884f8f.1
        for <spacemit@lists.linux.dev>; Fri, 24 Oct 2025 07:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761315232; x=1761920032; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DVsA5NUMk7Er151JpLhnqPMBBeiJc/C7dvaqVJvIrmc=;
        b=gTp4bUtTxSvgyNNuOQRpsEF0zqx5NQzf5s+2jD26hXLKjKlrZQ24Lmky/e5d2lIf8d
         HJu0GZhLN1WWaAjz7J9mRONjuqOM8cKT9bzyeaHzIjx9vm5O74DZ3M8Vetq6WjxXMAgx
         w8RtpJEHhw2rB+rURWOX1b5CXV+wjUN9a3Eh4mzG2NG44qYAS5lMcUMeNLP/EDFVfYos
         dbPv4Otcw2AS6/ym8+y0PH4TqTaiNfl8UOkaWYaSNDnZCB/ojXSQf2u91+UxPE9nGmO5
         GDdo6QtmrOzW3n4NCzne7YyvsP5sf29TgfgUEKqEeFWrhura4h3haBPdBK8vsgwvLqPE
         fg/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761315232; x=1761920032;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVsA5NUMk7Er151JpLhnqPMBBeiJc/C7dvaqVJvIrmc=;
        b=QFLcz8sr9PxhP0hJvAxCY4mC/2cLCzzDX7JJo1wJL0pHD05YY9GCAsxvi22jawRszi
         c1gXh3c1LeLJrhx5gYxNyaotxYrPssOyl1EICuFp7XdmQ/Wj1DcA4WtFW95DYPzLpPn5
         xDaRClMfXqQm3QMNiUyjNJ71n5W5W62JdaOKpg0NEfV1kfg0bUDD0/4VTiQ3WsECgOGX
         0sbmUKAWTFASvJp+TZUOOsTyQSDWzBQxYJ4ck0/TxeZ+Y17zvQcJ2MePrLyTmn494KNr
         oCHuMY9xl3z/qiCpaZFEWF6TiwrZlKltjO7S85W1j8/0RO2vAbhF6rIznSy9JUBAbSDF
         6ddg==
X-Forwarded-Encrypted: i=1; AJvYcCXGhCMOcTo62KPHa/Xu/F6In1k/0uuxFONLn6PDuil9u8VHckiRhgh7FLovpTRhJwZy5btry1kfkQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMu6s4kqYnTVUSVtiU6YiduiARmpHdZR2gA6Y6wmM1pb+ruyRE
	SWXJgllGZh7CPbTRqXDXHSVzID67/jt5oU0q5L/LmcyOHQzL6OWiTkifjMu7t+9Rt7Y=
X-Gm-Gg: ASbGnctnr3aD3n+IFTz00JDahf+kW/tDJ6XQ3JmoHtHb1yfxR4oJxkvhBNqNzK4ii9d
	GTnys8QN8SnxjNUfqDHTjRpr3iv4eik5ZRQZHtnnfeOSAtLfCECxcD3BmWn7MSnv5CYKjRgF3IY
	z16FL0t65Tf6QqzaRPvrZAVZHI2Z/3qGK9qZUWKHINtyd26/LY4eaP4NrVhrF5BLUlG08Vfou0I
	psP/RAab6o1q70V2sH1LKDLx+1HxVZkv3/QQ0XpzrIAjddHoTyNiRUNyZuioPyuKSfl0wgKRx97
	bYYuf5Rt/s0f6lUzHM3VBlzIdGygugBLyarp4JBh3qSi0CQrOlSKh2onRVoqckoWEqPoVP8ujKO
	8JbGnNfJPoAf/9EtI9EMjA+/C1OADADI4WKXJyBalwz+ydHHANm6+RRxUyEddIV4R5XW6yGwUXf
	iVQeEis4GkhTir2FRc
X-Google-Smtp-Source: AGHT+IGOwSSq4cPlqfVI2+cQc4DNxAbP8ipcdaug6FB/HIUIzgkN8w1ERIrzCxdii8Zp8hIOBEEMaQ==
X-Received: by 2002:a05:6000:2912:b0:3e8:f67:894f with SMTP id ffacd0b85a97d-4298f582512mr2780216f8f.26.1761315231940;
        Fri, 24 Oct 2025 07:13:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4298b996aaasm7851320f8f.3.2025.10.24.07.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 07:13:51 -0700 (PDT)
Date: Fri, 24 Oct 2025 17:13:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Yixun Lan <dlan@gentoo.org>, linux-sound@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: spacemit: add failure check for
 spacemit_i2s_init_dai()
Message-ID: <aPuJnJIeupM1PV09@stanley.mountain>
References: <20251024-fix-k1-i2s-dai-mem-v1-1-15f5f1ec294a@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251024-fix-k1-i2s-dai-mem-v1-1-15f5f1ec294a@linux.spacemit.com>

On Fri, Oct 24, 2025 at 09:11:01PM +0800, Troy Mitchell wrote:
> Add error handling when memory allocation for dai fails in
> spacemit_i2s_init_dai() call.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> Dan reported here [1].
> 
> Link: https://lore.kernel.org/all/aPtiNCZ_KBezL2Dr@stanley.mountain/#t [1]

Thanks, Troy

Normally we would say this needs a Fixes tag and the Link: should be a
Closes: tag.  It would be easy to make the argument that the
allocation won't fail in real life so a Fixes tag isn't appropriate.  But
actually it's simpler to add the tag...

regards,
dan carpenter


