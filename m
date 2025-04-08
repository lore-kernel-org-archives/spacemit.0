Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94CC6268FE5
	for <spacemit@lists.linux.dev>; Tue,  8 Apr 2025 11:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744113232; cv=none; b=Fnb4Jh4GYBCS5n2gGaODU2UUyEJy5UnbVTmsQnbkIiY+BR05HfLkUlibV36QgfKul75z80cEz2FbmHbgzs21JO8W2yQTEp5OsNix/AyyQylnfyYKkVO3i6s/ZxSKtBXbmA1dlan33dLXDOPDtl7eI7B1YUHneQOPWeWRlbiWBZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744113232; c=relaxed/simple;
	bh=Pj1y1wiq6EQ94mnXBYGZ6bdS7QX6U9rKMttG3lb2fjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZgqbPupyXqTOq7g1NE4vyD9fWsfwrfsQHt68vXU0sr2VE5O81+15Q3TFM4j+o9ECQIIT8xmH29i0agdLPpQH7kJTWckG5Ev3+VLQGbJHsiUfQATH2B8rrW0nWI21V6d94/17rjwg2LRc83Uor2Gc4BnWoUzHENinaRwGpwnyMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 568EA343096;
	Tue, 08 Apr 2025 11:53:49 +0000 (UTC)
Date: Tue, 8 Apr 2025 11:53:38 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
Message-ID: <20250408115338-GYA15656@gentoo>
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
 <CAMRc=McnW0YRMmikwu6qWSdWD5Zu227dBRwd4VeWZcfcEFUMDg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McnW0YRMmikwu6qWSdWD5Zu227dBRwd4VeWZcfcEFUMDg@mail.gmail.com>

Hi Bartosz:

On 11:03 Tue 08 Apr     , Bartosz Golaszewski wrote:
> On Tue, Mar 25, 2025 at 11:08 PM Yixun Lan <dlan@gentoo.org> wrote:
> >
> > gpio irq which using three-cell scheme should always call
> > instance_match() function to find the correct irqdomain.
> >
> > The select() function will be called with !DOMAIN_BUS_ANY,
> > so for specific gpio irq driver, it need to set bus token
> > explicitly, something like:
> >   irq_domain_update_bus_token(girq->domain, DOMAIN_BUS_WIRED);
> >
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> 
> This doesn't apply on top of my gpio/for-next branch. Please rebase
> your patch and resend. Patch 1/2 is already on that branch.
> 
Ok, will do, thanks

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55
