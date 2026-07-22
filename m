Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F872286A7
	for <spacemit@lists.linux.dev>; Thu, 23 Jul 2026 01:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784770318; cv=none; b=SAWcNxVwvMtLSh+E7TyrYq5K2hVG43AQ886MvzJAWQKThPqTlRga68oylAgV9ELmXJjQee6min5rijEvco9hCB3Lggv9uuK4Vga7WSA+CISVEMBLi/RcoivRDE7vAe1VlnGMkcSlejqvWUGI5K/LH81SuVQx8lUpf1fjXw+6eh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784770318; c=relaxed/simple;
	bh=dDIJ/HYqQHokQ9Y+SBy8Qss/CKOXlITYcWV4Pgc8yXM=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=kB5ypfjgJH9Bmu6CvJRjrsYRSZY0G4W0SyTEAW9v/IpP9cYBvuQkN/HLxQVlQK/ZHEfVI+aVCq9vmn+vUYL5e8phBTJPVNOEa9s/qtsF1HqlSvySwwWeiZ+EQpk9TBfWth1vZvW/K5Jsh/UUanXtU3y0e6mX3WMsjPU72Ycg0Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=euB0T8Bx; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="euB0T8Bx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784770271;
	bh=yAUgDyUzgV75t775RLHTRzDx+K4j+WGYlepCAavK6fk=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=euB0T8Bx/i9rRTN6jwE6AlDP1WWON/3T3R7ire95ch6WU67NVsFN1nhS2SRWnFBDE
	 sUW3MdVUZRt57YJKSeGLJGiyJNcdz9tu15yhW/miX53Ez9jtRvmEZBMKgRF4W6gasu
	 v64Ki8u2PbexVxAzQ2ZgFWGaEFt+BNpgTI50url4=
X-QQ-mid: zesmtpgz8t1784770263t38c77256
X-QQ-Originating-IP: bVYjHVoJ/jFoyrpIdXFPpgw76CxkbZdkCUD8fa/J0hs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Jul 2026 09:31:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15860423990033171300
EX-QQ-RecipientCnt: 9
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Jul 2026 05:15:29 -0700
Message-Id: <DK53C3CZF06Q.37189IIFM8VQ3@linux.spacemit.com>
Subject: Re: [PATCH] i2c: spacemit: request IRQ after controller
 initialization
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Linmao Li" <lilinmao@kylinos.cn>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Andi Shyti" <andi.shyti@kernel.org>
Cc: "Yixun Lan" <dlan@kernel.org>, "Alex Elder" <elder@riscstar.com>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260722094302.2284191-1-lilinmao@kylinos.cn>
In-Reply-To: <20260722094302.2284191-1-lilinmao@kylinos.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N4ZILu3POr3OIwaScrzSHsGFbS/q61DUNQMJU2jFaZjB2/oKABASSbJP
	0K+0muEUQkohCHwbrte8Ln6u0NE/P3OpSkPwBdnfs+EcXZwcR/47PboHuWJ1QgDPVz5kg3I
	d7O+ANDZXGAQkFOjEH+Dq/0KJ0WRpztB9ooMtIyNOeOUsCBgOz287NSiQwaZrWhBddMvkRS
	XuCaMarClzNoAJKmnnyyYVua7g4WBZ8pm7wcNwnI0CTNKrV+EMNFlAXssfwGIGS9TySscEj
	RdFOnoeluM1cX7nCMr1oyIq6b6Xl9qI0gl1mucxOF+tIiVarDUlOpmRW5Olq7/DSb5qM8qu
	rKqB9yp2ZGfnmdHu/+uVeFzb4W82OHLTR/T6OY6Zri9dOAfrEdbmNsVh2QuddOCpRwjvJ0B
	HOJlzYPBqjfAF20fo2ox5PbXyt8uMKJdnUvNz42j6AOMMIrFU2vYrIOGSmseCVKWbXyb9Q3
	A46LH/uhoRdcGiK2OABnjrE59pFTkIfwOWtusz7zCeK6kS9LcD4A1rjgfbprI2eUxOfr0n2
	b053nRk3PEsN9I0wzbX7XscKmmadu+WnFNkFvseRSkiiNKnsrP55OPbVgyMtUkGzWw6FxwO
	JZbT+/Vqk3UpobQQX8apVMLyo7Rx+CLgeHXrARLfn9mQwTizHou2PrVLFCZEgQZWP5/J7PH
	64F6Fb1IHKLPECjxDAPw3W9zMTjz//SL25D6w0txmyNg0rQbEWkNaI0dGGglawPexl7KXOc
	6QdcUVgdekVR+FIj1S4Qt2UTX6XV8U/we12hDpd40zT+nblKYAbjhPQ3VFuPoXRvI2U7GJu
	anrN54LmqsO9ZEVfSbNq+knYpM3kUzf4QacxnfAyoErbhcMbuS6oYLth0OXlFJiIffTEv9F
	YBb5RYq0oCsR7jUwrz9ohhVbYi97Is3yi1yhmRJ8ssAC0i/ceZTof5ebocvvD/jzfCl1NMe
	uAuLU/tYd9hbet8BsXq2rXUHyf/Xw+V8mIHVk9TPemmAzXYr9Zpp3X9bkdqPhcE6fMQW5WB
	GUguvK3qtZc3I6Hu26eEfmaNDzE6U8TZHlB6MqVQ==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On Wed Jul 22, 2026 at 2:43 AM PDT, Linmao Li wrote:
> spacemit_i2c_probe() requests the IRQ before it enables the clocks, reset=
s
> the controller and runs init_completion(). If an interrupt is already
> pending, the handler runs too early: it reads registers while the clocks
> are still off and calls complete() on an uninitialized completion. Reques=
t
> the IRQ after the controller and completion are initialized, but still
> before the adapter is registered.
>
> Fixes: 5ea558473fa3 ("i2c: spacemit: add support for SpacemiT K1 SoC")
> Signed-off-by: Linmao Li <lilinmao@kylinos.cn>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

This should also be applied to the stable trees. Please add:
Cc: stable@vger.kernel.org # v6.15+

                            - Troy
