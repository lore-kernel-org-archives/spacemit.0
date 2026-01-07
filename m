Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D173F393DD6
	for <spacemit@lists.linux.dev>; Wed,  7 Jan 2026 16:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767803042; cv=none; b=giU5sbo6Ifmb/8IbMA4LeT4TswRmncNprh6xjen+1JJ8GhD7dHcSv4/Cw0g1y9fGQfvJJQ7HCWLXj/M1iYAiWEnh7sLycxjUOH7vSrp8QMWNKnm8gFfw5Bt18hlLjXXCc1ISAaQpF+LLe5UNepgDRUHrAO0jklbgP/TyJaKdP/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767803042; c=relaxed/simple;
	bh=W4uk1VefUHGlDNc1aG8OtJCVw9QNApBQ62yJf8MGKyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFEKLorplcQeFYeu+DafabGt/GkK/9hc3zeuqIerWjQ95tWNKf1CqtbTQxKdMSWYquNfm4J+OGYC5zY2CSPaPAufz2NCTrFofDKhRo2n36MKs/21izSdAw3wuXd2cvaE7hzmZ3c+81b0BYBXmhtzNKnwjl3Rnp0Ay1NbINnyxfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nXqDoIZ8; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nXqDoIZ8"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a099233e8dso18109925ad.3
        for <spacemit@lists.linux.dev>; Wed, 07 Jan 2026 08:23:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767803028; x=1768407828; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OQ+7Q/Ti00gCIw+7hhy5kDVy5X0XQseCMCNmnyae2YA=;
        b=nXqDoIZ8KPppYgsYYG2XeX2TZjMID/Ej4VozRSB6pGo2VPeMZ1ntJJYr1y4cCkEeGf
         DVplqmsHKHd6ri9T7uHk9Bw0b8C3BhkygfAVbBSG2V4srTxrP3vofhfjU4EQV5R/N24Y
         nFWa2eDVzvc3CGRG5lz3q/8gtgwG4RJvEqWToUbHSj3XfDGKB/pp5CKx5Dh9+JbJlZ1O
         ulr0H6Y/eVNKRW+cU+GRpIkagdbViW951f/ehwbPm3t+8jHYCQK355bQUemW/15EiQa8
         choiiUPPhlu8NDP95yDKGNkBNZkwqFVB1alK+oxTl4zx9RJn/ss8eZACi370vCsnXxn7
         b/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767803028; x=1768407828;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OQ+7Q/Ti00gCIw+7hhy5kDVy5X0XQseCMCNmnyae2YA=;
        b=KjfoB7vX3so3vBtfjq0x3xemdj/slRRfS3xC9p5JL3A+27noFt4+d/6qZLLrg8U5DT
         ejCSJD1x9RqoTb+H+RvrBea3fWzCL2kd0rkmsRivuCOMPuH+j+EhzO6W1XDwe5tCT4rp
         qfbRfx3lpdZWwL1ePsIy9os6sXBNdz0Nuhmb+ERVGrb+oUWHK3xfab3E0BG0VCaDerEp
         eP+/k2PWITAzPdtt9V4+YxPTMsmqWmWoQv1HmYCMUJ7cst0PFU1pm9PQYh9d2FKmH+g8
         2AgkSryxYRCwyr0l94A29X6yAkM/5mLkhS6p0nE8rAOWJu5m9ONhQ7W7PHDme/wV9iX7
         54zw==
X-Forwarded-Encrypted: i=1; AJvYcCVA3jWgawIpa705GqBXcUTChG2JxuRuUxSbsZutMmKJL3y9Ow9l3BuoDMx4bK+ixI4fOoB6zhrciQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxTDG2FWhDhq5FvzOVlsF3dc3w+iE2mxpEFDuuiRHNYZvEu7id1
	72Gp4tU7nEFsJ3SIPa/WRnD6uGEj9Q5JsrgQW/5PDiDB3LyOcejDp2pW
X-Gm-Gg: AY/fxX7OXxYHExtGlpqyyEYo7mrt5NI7YMYRNR90zS6Aw78y+S2OYi9BSGKlFNVxCbG
	8EuwNbpkxQqZqWluA2b2o9zsd6rbhb1XpEt7lEFFMVAoktbY2jgEAk8bNuDrdK0TWlzGP41kgBn
	81Ox9iFriP04OuFL+0YkJF0GRTjeOGLWgb1n9RxdL5EiHuOkDX4gZgsDjqOFlvbTUWistuikG/J
	td4eA1AdZenlaTl4QDH74MqkRMd63M6S01qu2aVBLGBA1mDdUK0Yp0p+Sh0WZxGvL2pKooKHucP
	UREzS5qev2uCIbkV5znCixcmgXmvxQaMdBn/bYPdqHUKjeQJHU6s/5jQbDc2Yd34YUq3X5n0S8e
	z05+bzs0Uc7409EabP7rKKnoSHvfldS6fhMrlxYcnqyCn7rfZ/qn/V/X3/3cAyLTzNb3z69AeDI
	38tbI=
X-Google-Smtp-Source: AGHT+IHaiHjB70xigUp/SSo/W4q9gkk85M7RPzHR2gkRrQPwVPEkFh3CLZSZ2WYZHlPy3Xh1Wb7TAA==
X-Received: by 2002:a17:903:1108:b0:29e:e925:1aa0 with SMTP id d9443c01a7336-2a3ee4a8758mr26237475ad.45.1767803027716;
        Wed, 07 Jan 2026 08:23:47 -0800 (PST)
Received: from localhost ([211.94.250.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a4fcsm55666365ad.12.2026.01.07.08.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 08:23:47 -0800 (PST)
Date: Thu, 8 Jan 2026 00:23:43 +0800
From: Encrow Thorne <jyc0019@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org,
	devicetree@vger.kernel.org, dlan@gentoo.org, guodong@riscstar.com,
	krzk+dt@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de, palmer@dabbelt.com, pjw@kernel.org,
	robh@kernel.org, spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com, troymitchell988@gmail.com
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: add reset property
Message-ID: <20260107162343.GA49546@hailin-HP-Pavilion-Laptop-14-dv0xxx>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
 <20251230150653.42097-3-jyc0019@gmail.com>
 <aV5r8k4VKnXX_9Sw@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aV5r8k4VKnXX_9Sw@zenone.zhora.eu>

On Wed, Jan 07, 2026 at 03:22:42PM +0100, Andi Shyti wrote:
  Hi Andi,
> Hi Encrow,
> 
> On Tue, Dec 30, 2025 at 11:06:53PM +0800, Encrow Thorne wrote:
> > Add resets property to K1 I2C node.
> > ---
> >  arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> 
> how is this patch formatted?
> 
  Sorry, I forgot to add the version number when I resent it.

  The initial sending process was interrupted, so I
  manually regenerated the patches using git format-patch 
  and sent them again.I have verified locally that the 
  entire patch series applies cleanly.

  Please let me know if you find any other formatting issues.

  Encrow
> Andi
