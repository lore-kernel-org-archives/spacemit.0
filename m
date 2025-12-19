Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0D9284674
	for <spacemit@lists.linux.dev>; Fri, 19 Dec 2025 11:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766143771; cv=none; b=raVVittNEw1c90LZlIJSHt/wiAlDG5tzr9sqo8b8S1AMf7HRUMQ8rlqjciNczTsiPkbqvDq8V43mvytU5ufYuYwtN8KsWdSKkUw83kCeHU4nzwDX+4xenQel1ELPIx5abTOjrJUL8vsIFNRQYIUkv1xYcZWLU11LbkOL4DNh2Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766143771; c=relaxed/simple;
	bh=XFuVEHn/TxBTRRWaAWU3fJy2hgnXNvCNt1VzAAL7Fag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpigPq1SNS8IiU72xb4PNrYLz4HcyMckO+Xvo81nuNIj6r5B2Uluii1cSfXVaMcKtjtZhvyZ9Ec4ZAnceRf22a4HaCwkcCBhBwh29MPwg50KrL/AEbTbJVOnRSyTbWyefwsH/fhy/aTksfYqygs4n6VLPO17xtIcK+myOcgk8JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 5162D340E06;
	Fri, 19 Dec 2025 11:29:28 +0000 (UTC)
Date: Fri, 19 Dec 2025 19:29:24 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Johannes Erdfelt <johannes@erdfelt.com>, Yao Zi <me@ziyao.cc>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Binbin Zhou <zhoubinbin@loongson.cn>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
Message-ID: <20251219112924-GYB1955339@gentoo.org>
References: <aUAF4iNjuP5AWJaf@pie>
 <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie>
 <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
 <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
 <1626d445-fa7b-4527-b1d9-4d141d8b5ee5@rootcommit.com>
 <20251217221004.GD31109@sventech.com>
 <d5917806-56db-4945-b336-89bd1027f613@rootcommit.com>
 <e1cb227b-a55e-4962-b7e1-b540ba92012c@rootcommit.com>
 <CABdCQ=N4eZyBNBrhOQsW7jSeJmr=xhicwW8fskOAioV1q9cC5A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdCQ=N4eZyBNBrhOQsW7jSeJmr=xhicwW8fskOAioV1q9cC5A@mail.gmail.com>

Hi Iker,

thanks for pushing this, I have few comments

On 10:49 Thu 18 Dec     , Iker Pedrosa wrote:
> Hi Michael, Yao, Javier, Johannes,
> 
> Thanks everyone for the great discussion and the guidance.
> 
> First of all, I’d like to clarify a point regarding my previous email
> to avoid any confusion: the detailed technical breakdown and pointers
> were provided by Yao here in the thread. My mention of Javier was
> regarding a separate offline conversation we had earlier. Both
> contributions have been essential to understanding why the SD card is
> currently failing.
> 
> Given that we are all a bit tight on time, I think it would be best to
> split the work into separate tasks so we can make progress in
> parallel. Based on the feedback, here is the roadmap:
> 
> 1. Define a separate compatible string: the eMMC slot has a PHY, while
> SD/SDIO slots do not. We need to differentiate them to apply the
> correct reset logic (skipping PHY init for SD).
I agree, separate compatibles sounds more feasibile, vendor reuse macro
of MMC_CAP2_NO_{SD,SDIO,MMC} to differentiate the controller which is
kind of unmaintainable

> 2. Extend the pinctrl driver: support is needed for switching the SD
> voltage pins from 3.3V to 1.8V.
we probably could leave pinctrl for now or take a look at it later when
really necessary,  the default pin settings should work for most cases,
besides, vendor is also starting to drop two pinctrl state implementation
(the normal vs fast ..)

for 3.3v to 1.8v switch, there is one MMC1_IO_REG to control it, and
we do need to implement a _voltage_switch() function
and it's in another aib io space..

> 3. Add tuning logic: this is required at least for SDR modes.
> 
right, especially for high speed clock

> Since I’ll be focusing on the driver/reset logic (1), is there anyone
the reset logic is also needed for K3 SoC, so I'd like to get it added
early, I could get a patch for it during the weekend if you don't mind,
or can leave it to you if you will do it shortly..

> else willing to pick up the pinctrl (2) or the tuning (3)?
> 
I do want to work on SD/SDIO support, but for now I need to push
clock/pinctrl for K3 SoC first, then will have time to take a look

> Looking forward to working together on this.
> 
great!

-- 
Yixun Lan (dlan)
