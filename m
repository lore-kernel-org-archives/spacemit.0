Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91CED2F6578
	for <spacemit@lists.linux.dev>; Mon, 24 Nov 2025 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763983823; cv=none; b=EuhwxdxlweILGYmMh//i5BO5iYKZM+A23VS7h2sKoE8/sQTJOeKG29J/fab0v0bDVcJuMj8zvDA6/K1sOgwG0HAj0LFvP0KuPAfTav0drppWzjDguDTzYIlRk6FhVDtoyBTQCIL5j5c6LisIG/tjTTYh78G7Aq3bQmOc48bzsmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763983823; c=relaxed/simple;
	bh=XReSYFVRQc1R76schfZOU6PPOXo8Qr2up3qP9x+Ua70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HIGgvDeI//d+n0Mz6lklmpfiZczus1v3Hv85klyHUenjJ9l2LpqwXockqorlicRFf6ddoAADlwcJsysVgOHmG5Hbe2O/XBL2fXcVkwuj42tPs0t7LpeEKTJWN2fv91UkTm8uwyn54VOKbi7r6M1J572x89MNoLIRr0mhqsp3Wh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=DjhJ/Pg5; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="DjhJ/Pg5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763983777;
	bh=hAWwl45Wdpi6H1FkYhrQMC5Rki82zAkbyIyxhMkT/Jo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=DjhJ/Pg5t7341/qh0wUJyAGeVYszSgVTGezVtW61hWnEdu8mXFqi4TQsSkvmVS+HW
	 kQLLQ7oyP945CawpPJbeJZuKyLPBSUFCyVyIRSG3OZXlO/igJOpZDJaLMSGqsBpdCl
	 DpE/6VIGMeGUuxi7EcfhGO4FjyjG11uC5Y4rGspw=
X-QQ-mid: esmtpsz17t1763983772t94d24c3f
X-QQ-Originating-IP: fZ0jTGd4WyWVTGFqd1o5pG99je12tx6wkLj0jgyqLMc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 24 Nov 2025 19:29:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11626773636746068601
EX-QQ-RecipientCnt: 6
Date: Mon, 24 Nov 2025 19:29:30 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Junhui Liu <junhui.liu@pigmoral.tech>, opensbi@lists.infradead.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Xianbin Zhu <xianbin.zhu@linux.spacemit.com>,
	Anup Patel <anup@brainfault.org>, spacemit@lists.linux.dev
Subject: Re: [PATCH] platform: generic: spacemit: add missing objects.mk
Message-ID: <03A15D6686A3A9AE+aSRBmpkBhccbZlYJ@kernel.org>
References: <20251124-k1-fix-v1-1-8d7e7a29379e@pigmoral.tech>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251124-k1-fix-v1-1-8d7e7a29379e@pigmoral.tech>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NXAazXCEWOjYMpjkewyUuza1e177MacYmeU9Zu9ewLIYCBAxJSWYyE5S
	vPbQlTZnaFAs/74W7pDPzvseIU9+mkkMvvrrHvD0LmWxaYTDO5A4iJHbVzAij7UD6QC0WuB
	0GmF8dNWagPB+SJ8BhQXrDbiXZ3V3c6YOCToU/EPsq7YGb/kGX00Tiqm9/9N/2O+i2sLeXv
	LcDZPFBy/GyW5pDPKF4kAGdkc5/aQoOkkdz7Pg/VuLq4JxzzEU1BmsUbm7U6bajNVuEbJ+u
	D+/w3PTdGN2uNw95A4XJQ2flcxE4nNWRMX1uhvkO/LRKJzP1auV4dUaU4/0wOhgYpIKuAuY
	2YNXDjDz9kNyq33Ynh7v4shPnoAcRzqRrY/YxEOygbJesdwPO1QNbGdPf76Dv8AEVSZ25ol
	LToegXXJFNjd7J746ZC4aULid21+13ZMkowH0e3CaGTlktr9p8SyJcHb5ILoTgAjyC/J1Ts
	PmQluXSU6HORBsJ9dqYW8CWfIXVXrLMJfgk6dhMoe4eWus97k/E5TNhzogtG71sAACCrhHe
	ZOo9xzltjfY5AfiXjk4rfvcnqN1FtTyvDGnHwc3fHLW/cIelsaNfB1RVzTi9oYGK/Vv0hbF
	hJkHhvVNQLZZzX55nRBNajN6461tisx1DcIDudU1zL6IKOn0nuLmYezIPN5TcidCVcxmKkn
	6zoIaiEGiSjbYNw+47XbXl+hXjhGcoZHMrKCXhUgNrl8UK2+xjo5KV2NaF2kLj/Ez8DLuU1
	s+gXtv3QbFzQfxMwqEiFOdfrIx42kD0rtC4fzyjkq0FKmPe6B2Lg07mzJuC9ioMrG2Eu5Qy
	LEWXHbngsfWVyzVJmlnExj4trruOF9fD3X6sU1yTl2LEplffvcfSAqaMuXIS44AnHtrptGY
	IaWur6tI3jBFQwqhxDy5qRjgBEAgWKXhuMlnkfq82bKsX2E5kpLrYEnKbSYiFyKXRXC7BEl
	RdfhrDptDqeS1c5kEEiXeJ/+lQOvykJFSd5KNeKfLJX1HmPuYG/plBmw4lDpj7UgCsy3eY0
	FHQSW5z/qTj3ZGnL4AcLnQ1n0pkChlf4BvHvoqo9vdthiHTokcPSM4Bxp2JeORwUkSd8OxS
	g==
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On Mon, Nov 24, 2025 at 07:16:32PM +0800, Junhui Liu wrote:
> Add the missing objects.mk for the SpacemiT platform, required for the
> K1 platform to be included in the build.
> 
> Fixes: 1f84ec2a ("platform: generic: spacemit: add K1")
> Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> ---
>  platform/generic/spacemit/objects.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/platform/generic/spacemit/objects.mk b/platform/generic/spacemit/objects.mk
> new file mode 100644
> index 0000000000000000000000000000000000000000..dcb37867aa661dfc559088f926cd1465bc0f7e8d
> --- /dev/null
> +++ b/platform/generic/spacemit/objects.mk
> @@ -0,0 +1,6 @@
> +#
> +# SPDX-License-Identifier: BSD-2-Clause
> +#
> +
> +carray-platform_override_modules-$(CONFIG_PLATFORM_SPACEMIT_K1) += spacemit_k1
> +platform-objs-$(CONFIG_PLATFORM_SPACEMIT_K1) += spacemit/k1.o
It might be that we forgot to clear temporary files during testing.
Thanks for your fix!
I'll give a TB tag after test it.

Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> ---
> base-commit: fade4399d2a47a3ff9c5ecd5dd4c3cba7a4eace7
> change-id: 20251124-k1-fix-433af01a7aa9
> 
> Best regards,
> -- 
> Junhui Liu <junhui.liu@pigmoral.tech>
> 
> 
