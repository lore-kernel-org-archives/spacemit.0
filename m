Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA26B230251
	for <spacemit@lists.linux.dev>; Tue,  8 Apr 2025 16:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744131491; cv=none; b=Mvm533+lzQoI0aJcYWU5x+pi3ydwisdlaLGhSpNeu3UB5XHOzsYRXH4M+qQmNyl6DTBt65aSIErmWafF0Yt4+3Y5b44IyOXFoTXnoDtEiybCKFJsGbMZIR0wCi/iFVT+ei8O0Yphe9thOkYQcRjwyFSgEoKpjKhWqIA5DA+PEDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744131491; c=relaxed/simple;
	bh=rV3IzZIww9h+n+TZSLe0bsGFVsLuLTB1QeJQm73XtYI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rDU98+PD3aI5/ToSnkhGH5QW3sjz0/Kp+cWeO7lWpVVnMC7slsjqOC5iqP61/g3K80xBnBNf7FSNUfLJ0EeEMQOKF9VVUlCLJj6S8SRk8cZqrNU1kA/eHRbZ0raYM2GknqrM7wvL6vNKTJDHkkBjpxabsR45BxDODQH6CJGLpFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gyPQfZqm; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gyPQfZqm"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39149bccb69so5466385f8f.2
        for <spacemit@lists.linux.dev>; Tue, 08 Apr 2025 09:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744131487; x=1744736287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8uGIqPGo3/RzZiaVHiqgzYEtP/BWLkkvzIhLsqEr0Mg=;
        b=gyPQfZqmbHnsIjttREFDW32KAnEn8AR3Wpqtmb0mUjLvBQ7Jirs+c6nxUMpYbJRp/2
         mxaGfMpCS2v2xoHBTnjxRCZjyVjcdK57gcA4xDYTWNvdO+BhNQ2zF2iWMYrhy9A0eX6B
         OMiqVyyycIewgx6i/3qf3J8f/nbfqnS3p2nyiyxTEvpsAYoYBohvVNUm8NdINdwCfo17
         aQpotU99WtVDoEn66WISGrPD9xaHu2gsj55VUer1F72Baf+XZNCRiwF4+KA+V/9/3RG+
         lx6MMvhp38tHt1VSqUfTK0Tkg8zM359kPfTmWd2zfF+fWT45c8MR26wEDThA3+lj/e4M
         zWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744131487; x=1744736287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8uGIqPGo3/RzZiaVHiqgzYEtP/BWLkkvzIhLsqEr0Mg=;
        b=ta0e5kS7qpLnNG/jNVX22DpWH0IUPPHGZ+5CsFsLm3Vc1FlqZqBFMVm5BYwbtHh3nX
         uikxkQ9mA+oEDYhW5UbrVb4kZiNnzZV4YvGp1p0AN7xJtYqaKLgaK/0z01rtFa27LzL3
         byRvLrR8nmLmbJLRA+jj9GG9J9FHJSgPrbQPGIRTlyBbtCYfJfYMzx6/nGN/f1xtOYrl
         deXmlzo3jku9UqnXA3dNk9vB4erypm9L7n5yzd58CnMSLWZhokN4TnsxoDtMwIg+vzxB
         ZnzL+G+1eOiPpvTSz5To+9qbW/UYjo8sAUkzULJRIwD/DQcEbPxqQee/xLZlHowL4v8g
         U1NQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgJTv7fKo4pSEcqGngNox3KglQzl4had5nMZqs8ELi74W8Dt1zZEWWWg0hxLcdaz1Fy6SD/qeMrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyE7mK6OAYpc9CoO8BF2qycGuu9lCH2bpH3FQ9eeJA86xdBj124
	TLLtOUDGiNVBXq4Vo182xytu0yQcLCUVQRn/mtCh95WRXhdKYZUl1c74QYnTCYc=
X-Gm-Gg: ASbGncs9yOPwPKFea7yCNVj9RQzK5Rcwrs8GiJfeTZgMpClUUU93jaYrE60wAM35utx
	rgBm42Z6bKwFX9Y5ryyLWo3z7oQhf/O+bQXZCDWA+nX7WTkRYoQju+/xW1nXIA1gMMRyVBdDYou
	N3ShGtk3kWRbczW1i7ZtcwQIEu4DVfU393sj6WiZ7BTFYo79LcxRrdRNcTc24ukQvUHmg5aw3d3
	MFBdrR4AG9eR2wwgcY9maHdPpgelyZTYIACnHgP6K27JCirTU0R4dUQvrr2KVZAw/eaTIBBIgBr
	wBHdcuFqrcazRq7mMygpgNlCtYZNb59i1N9/2Gkdu/9p
X-Google-Smtp-Source: AGHT+IFGsRSNGsLurl8DoyFapSJyV7TtJ4uGe3SGSEX3BrkLYJ/yVCM++z6f1tjo7zrernLeUKYo4Q==
X-Received: by 2002:a5d:5f4e:0:b0:390:f9d0:5df with SMTP id ffacd0b85a97d-39d6fd3647fmr10095287f8f.52.1744131486678;
        Tue, 08 Apr 2025 09:58:06 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6a60sm15141709f8f.29.2025.04.08.09.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 09:58:06 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>,
	Yixun Lan <dlan@gentoo.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4] gpiolib: support parsing gpio three-cell interrupts scheme
Date: Tue,  8 Apr 2025 18:58:05 +0200
Message-ID: <174413148280.131421.6673320812296091453.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
References: <20250408-04-gpio-irq-threecell-v4-1-fd170d5e2d2b@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 08 Apr 2025 23:11:20 +0800, Yixun Lan wrote:
> gpio irq which using three-cell scheme should always call
> instance_match() function to find the correct irqdomain.
> 
> The select() function will be called with !DOMAIN_BUS_ANY,
> so for specific gpio irq driver, it need to set bus token
> explicitly, something like:
>   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> 
> [...]

Applied, thanks!

[1/1] gpiolib: support parsing gpio three-cell interrupts scheme
      https://git.kernel.org/brgl/linux/c/27986833e8e675b6c17654d13623590a46f9033e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
