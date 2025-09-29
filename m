Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DDB29D270
	for <spacemit@lists.linux.dev>; Mon, 29 Sep 2025 06:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759127832; cv=none; b=Nc3aD0Q8OAfbr9Y87QLtiO8FaYgu4QUfUZ11WbpXnwiwxt5HBnQ/g68aXtaq4T9s8fsvgEamjIO5p3hEM2L35U409gFOW5HmLkAZC1J1eF723IUTNtkybX0F3H3Imze3wZDErKinBAyM17YXOTmqgZYh4MFNbEPo1K2J0aNh35U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759127832; c=relaxed/simple;
	bh=3BDlhAYjKpAwNf4nXL+xwodfJ4mfUZA1oxHiXd4vkoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKh94uRLTnknC0CAxS6YkFFBhvenRpW4fpzNCBr5i4xl96Z2F+pgVaz4Cve1HJ4UnJmhZOqSdVK/4Lwc5USEcfEREzIFpc/vwwiTgrOQPyLtkI8hxfw9B6PGaw3MwfLCAo46mn4+kNjQTgRuwgo2seSxuvHvsNs00pUN91E9XOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=FW/yx/jN; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="FW/yx/jN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1759127722;
	bh=ejimwnI9aX/m1BdqmcNn5j7nwrGn30aTITlrZgI0KGk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=FW/yx/jNgaiXTemr8O5pO5W/myGrdSFMcP0NQvmn5z3X5CzN+9xvbXW9rPVD516w0
	 pnDVbuCnhpLoddXflwyXEdQKSDeNJAGwPzJRCmO5stL8peulZk5eXjxh795f3rU9M7
	 BWoqus3AahQ+zjT+jtSqL0BI3pSE5+LcnNxWboSI=
X-QQ-mid: zesmtpgz8t1759127713tc7836ab9
X-QQ-Originating-IP: NwVyzrEDCHyZaDavr4gvamMM7hZdIJSffBPvgKhI67s=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 29 Sep 2025 14:35:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9334752308087901994
EX-QQ-RecipientCnt: 13
Date: Mon, 29 Sep 2025 14:35:11 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Aurelien Jarno <aurelien@aurel32.net>, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: "open list:SYSTEM RESET/SHUTDOWN DRIVERS" <linux-pm@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH 1/2] driver: reset: spacemit-p1: add driver for
 poweroff/reboot
Message-ID: <BC3683F224622068+aNoon0so2erXE5I2@kernel.org>
References: <20250927220824.1267318-1-aurelien@aurel32.net>
 <20250927220824.1267318-2-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250927220824.1267318-2-aurelien@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MfQnJH+7WKv6uJLCgeaendjzz7VpCXsS45ED/NVsqpSU1+JZ5K9SZQfL
	dHYzeRrZoK6Ub9GteZgPVgwiHaSjTIX091I5btsTAG7BHqpPTJdBUbfrsj2B5YvA+1HzstH
	AezOcJnA4Otk8scdjfQU5krbmW6Xl5Or8hP/gGuOefEKaasb6mE7jZ/RdLS4E9JywhmGn3d
	q3mCv+X9TOQFSdQurIfizGa+jPsqgmr7J4CQCsD+RkQNzr6vsWb2a4TKjCL5qoe4fYog0i3
	kUGTwdfMIFaFLc7et/KQxoVnqvYo1OboCmQCD2F1LLLLXsxlmDLi/xM+pbeL4hE42pN+EJE
	F+B7xUosduilGO486ycCH13vo3+aZnHK0yDtVmztxDyoqWXTBjo2wKGvYC7UZakYp36V4ro
	2/e4c/p8Cx6V0yzx+G0U2WEojkKi6v0f3QN6O537SCCe2d91RcsGh71yWFkdDqkAZD3D5Qy
	UuZ9FWqQC2+s5FLXYJkgjDlgOMHWrF2tiLa6YT9RISiDKxheFsqHDsmhBHE5vBwyFokgJkM
	hgzt6xp4wOeYK5nXPjKHrDouBOTKxtF26aNpfOZJCPGT/5aOGH4pqqqe2kXC/D04S4hFo9Q
	7TU3TApNacK6lEvOP97Q6AEbopxe/p7F3/q+5RbDsZEiL9ok93Dxftd4YwKmVRIzJtZXDYG
	b6Eeo3t04nqhu5YxBueEHtQ4DKFY7UfM3tfJJg6et60UV7Z15rqJle/phYsy9QIwEDw7J8I
	4El5lh64lighP8eqBVMseRM9NAtoJcN+58VYuqOvO90aicURNd1bMAXra1jsizx00bQHxCz
	hcoZUmwwj8Jzr8HnDWv+ouVm2ieoH9f9wNxWkj801dQkNSUmMtX6EMdCc0/LipyV9bB/GST
	WEXM5w5IZcVG7/nwUQl80/5SsoIWa2/g6H/W7rPv8mMWi4195iWCndj3WO9/IWYxx1tAt3W
	BKP9MAH6PnPk93fFeNb9vrydsk8AjmFwyDn+O7In65zaC/hSOBE8NjGmjulYbg76ohM1rwC
	MO8Py4VGtr2IAUulKty4mQuYWWa7eHLRb8blpNQ3DsTONxRlDI
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On Sun, Sep 28, 2025 at 12:07:40AM +0200, Aurelien Jarno wrote:
> This driver implements poweroff/reboot support for the SpacemiT P1 PMIC
> chip, which is commonly paired with the SpacemiT K1 SoC.
> 
> The SpacemiT P1 support is implemented as a MFD driver, so the access is
> done directly through the regmap interface. Reboot or poweroff is
> triggered by setting a specific bit in a control register, which is
> automatically cleared by the hardware afterwards.
> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
Thanks.

Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
