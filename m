Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B433A1A317D
	for <spacemit@lists.linux.dev>; Wed, 20 May 2026 06:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779258019; cv=none; b=Kk6aCpoCU1AqkDvsbUVHQxraNrfg9gNYOEVMRSPHxPFC2LrUOQ15D18uu5n0T1D2rQtQ87XrJXGQ9QHTNe8B69n3V1NjPGAjzP5DhjGdZVflA9KxGRb2dU2+bTo0jwtRXXDpRZ3bBGNgyGnJPuFuKQXfbBbijwnBExlIyuLr3w8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779258019; c=relaxed/simple;
	bh=a6fGxEH5BMyjsqkygp2GVPtB+r+Rb9RjEJSwUu9XC/g=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=pL7ePVHGsI+kYkOUOPRRQw1RyFRfO87ftUMwEw/qL24OJGWBaVC7mJjbB3EXOPX063MEWhh953YzzZ5nGxoZH01ezdhbqQFnfA4k6dt+p6ZfUrFKqwlZd3FABp7DeitX0eWL4lTJkoeOsb/5xm/28D6MkO6G2PcScVYatSq2SuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=a1tTMgD6; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="a1tTMgD6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779257949;
	bh=hg5KK2xUCyB4FLoYLYP8YswpRDV5uXbEMujGSGVHGUA=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=a1tTMgD6pTfjaggmgL42RSaT4YhHoLKTs0wYqvr0xnhj3x0tx+wMEpBACCqwxgPb+
	 l15qc8pd57Q+lIO4khmpkVi9gcRNSn/m3qPDycREwbzMb6OqIgNnpveqA8KMYeBWgw
	 ch3qtxd1kJ2klhCiyixHE8cdoQmw6We6GPLSkUo4=
X-QQ-mid: esmtpsz11t1779257947tda20d2be
X-QQ-Originating-IP: 0xEUe3OK3WD/fOJoDhBLmRz2RyrACzSv+nYtYCmdgDQ=
Received: from = ( [210.3.135.34])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 May 2026 14:19:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9958252558601639694
EX-QQ-RecipientCnt: 12
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 14:19:03 +0800
Message-Id: <DINAAUZDL8PS.3KJXPTIHPXQQY@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Han Gao" <gaohan@iscas.ac.cn>, "Linus Walleij" <linusw@kernel.org>,
 "Yixun Lan" <dlan@kernel.org>, "Hendrik Hamerlinck"
 <hendrik.hamerlinck@hammernet.be>, "Anand Moon" <linux.amoon@gmail.com>,
 "Junhui Liu" <junhui.liu@pigmoral.tech>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>
Cc: <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Han Gao"
 <rabenda.cn@gmail.com>
Subject: Re: [PATCH] pinctrl: spacemit: fix NULL check in
 spacemit_pin_set_config
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260519164007.122574-1-gaohan@iscas.ac.cn>
In-Reply-To: <20260519164007.122574-1-gaohan@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N1ZgNUtaKtmxFhz/8yV8b59Rf/Xjd5V4g197HXPXFy8kmwrfWjtJ1eLK
	3AH+Khnk+xT4mCC0EnLVgIOAA/dy0hvU/uCH0qp7dcypvu7uNBmL5MHreik9gzPPiqaXC73
	orfJ1tesQBQOVlx0vDg4TeCB7O72Yw0FmvFSjrFSxXw/D6sui1sUCNS3NQbsNi7qG9lWr72
	ujoNKA5DXgWGwpl247SUH1JeyghyBxYjDq9EACVjPDHQS8Ptoef0H1QI6M4MfoGPjAvbqRv
	0mDxEidEwMS5gcrJafSzOhuV2+tXuElJE17LHovA9RMStUf+kTh95AgC2GMmCTYCcbYq8No
	8B2Mcvzh8v880nF4QHzwQ29N3yrZPjUrOJ/Kk8lrY05JUszC5EFROD2YNngFVSeMWQaT5rs
	qaw+0QyzW8mXsOdgJL1YyHYCMtllFHcZeAyyjCcbIEPbJ4f0p1BWzZ8wE97j+fMD1iaqLt9
	opgD18PY1qN91fvHPls/piU5sT9HVMnoCLaoKurj2u+nP7+q6PJjcaxtH3/JgoN4suHYUHh
	HEMWdtuzZYI3cIX15Soax1OPqzcQiHB8QY+qv6jx6ogwhpmi4IuPxUElKYfBrBOj437nDbK
	49sO2j2yZkwKxI5DZTqdKtsW7dXGqizZxFXVn+SnhE7kOcJdQ8EGM2Bw4hfiUzmiiN08gBc
	7ObzDJQWFR0rb+elKWhNTQcjz1BMe2hBlfGaht6oh1Y/v5A/Rz3jJkbGMfmb4aG77lDDn32
	NQ9yWNcplVXEBP/jEoWp9TaTpQCqncjs1nzDN+4OyueK253ged24JXTE6/k4ipbKwZM0P1/
	BUCU8YZR1+UZWxfdeixFTvZt9DJRuZwzQZ5urRoBc+rn7Wmf4K0a6fwX8jaVrOBJDcQGSyI
	wjHx5koIndeiU4d8/daoPgLvqpV+yuz235GeKjQzPU9GnzrhhKjuHjzzCNIU+wFQU95eG3V
	KkE+r+5KUk4/HQJwxNBtAXcgxi90CW92rrOvc20lZ6abyKpYSb2LChg4YPiyTLyHroLLDuO
	T99UBsz7HAn/5BBSKJ
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On Wed May 20, 2026 at 12:40 AM CST, Han Gao wrote:
> spacemit_pin_set_config() looks up the per-pin descriptor with
> spacemit_get_pin() then checks the wrong variable for failure:
>
> 	const struct spacemit_pin *spin =3D spacemit_get_pin(pctrl, pin);
> 	...
> 	if (!pin)
> 		return -EINVAL;
>
> 	reg =3D spacemit_pin_to_reg(pctrl, spin->pin);
>
> pin is an unsigned int pin id, where 0 (GPIO_0 / gmac0_rxdv on K3) is a
> valid pin, so rejecting it here drops the PAD config write for the first
> pin of every group. On K3 Pico-ITX the GMAC RGMII group lists pin 0 as
> its first entry, so its drive-strength / bias configuration was silently
> ignored.
>
> The intended guard is against spacemit_get_pin() returning NULL when the
> pin id isn't in the SoC's pin table. Check spin instead, which both
> restores PAD setup for pin 0 and prevents a NULL deref on spin->pin.
>
> Fixes: a83c29e1d145 ("pinctrl: spacemit: add support for SpacemiT K1 SoC"=
)
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
Thanks.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
