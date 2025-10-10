Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239EE22258C
	for <spacemit@lists.linux.dev>; Fri, 10 Oct 2025 06:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760077311; cv=none; b=qZyGgqlOZdI+bxWxY3JBRaGopUxTtY+M0uN8pTrGoGGsH/eaHyhRhMxDZEBKVda1UIL5xK8Z1nBGrc5qC/ogeq+mS7YJGE7Qj00JMDtZ9VOuiTTIM3JZ48aw30TBXZjHhNLkLaMGbJjFbMTi6G9oqiUHUANQXYYroF+/jF6M0I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760077311; c=relaxed/simple;
	bh=oykrhFWgZesqcj52BXiP2fYebBEd0nAZ+ziXf30Adlg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=al2zMIVw6qg4Ca2lzo94Rz6tybYhKFQ5tPwplvROqfBjo2sFlDzpNwTSuwm6L/BBUBeTh7By8jbMBshmPshWbVizivihbkREQCoQ8AQ2SWyPqb319laLPM4mppaf9PbOH5IWDRghZy2sfWxV8IrMESugwWrpB59js1U06/BZOFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ukVJIHkV; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ukVJIHkV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760077223;
	bh=fY5GWREGM1F0WN0Uk0IHs1MX+GE6gCX44IiriVQy/ls=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ukVJIHkVPxjdc11XyPBgjnwxcF79PO5gB85SBVqZr4wV4t53/PL6NSK1jUZ6KyxHD
	 KFhg/Mzh6f/0GwrEzj9fTvFM/H61pfC0eI4xq0IUMrFOPnxjVjBpEXDAmewa63IDEw
	 OqYi0DhKm/PQHfAL0KrRsaRt/r8L4OMw68bCG+qo=
X-QQ-mid: zesmtpgz4t1760077214t21b1d401
X-QQ-Originating-IP: 1O0RQKLiP8/EwcUIGSXn7afoUGmd0envjFBUs20JX6E=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 14:20:13 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2431771121863430806
EX-QQ-RecipientCnt: 15
Date: Fri, 10 Oct 2025 14:20:12 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Vivian Wang <wangruikang@iscas.ac.cn>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] riscv: dts: spacemit: add Ethernet support for
 MusePi Pro
Message-ID: <59657BBB86F7B678+aOilnA5Z-QL7xF9O@kernel.org>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
 <20251010-k1-musepi-pro-dts-v2-5-6e1b491f6f3e@linux.spacemit.com>
 <a02aec9a-976a-4b63-86cb-126b8ae71185@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a02aec9a-976a-4b63-86cb-126b8ae71185@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OLsBWtCIHsg6BDQjHi6LbISIF+JRl9FZBdY2C826UFz8EAFADcLMWgWT
	y3QWdEeF7FucvQNloE5F/up9z0MG2caLSvsOSrWVslfYqVydB4t2t2mrAr9KovPrDOSl98l
	jLMeM05wRAVRD6xi2pnEn0cuSQYwiPq5HMGYm4VyNGAhoa/Q1ymZHCGuBl3ZfTu8KOOnoRB
	BxmwJWOGANm9brXNMiwNHecU+4OFLYVlpK6RDxZZvX/72JrSWNTLx+9MDI9E9qYqKsl5hRF
	f4/Bz9wzsx0EiIW4hxb34o0K3eweoA3klSlaIhwrqTe7t/6zx1+72ZTZU4MM5/KukqMlTfC
	RQPjOnPqj5gMeWEd1jYjJXB+QggUI6FHcKncchU9sMzfsk6JjrHEes8+5mGBsXEayKbecDc
	A2VMQ16+tO43yjtht+01MtryNJ8d58Ft7aG/v1HV3nZYnrOTp0TYpF0IGpq8g6+9tqsHfZy
	OehqYwvgqhQdgODlHjmoMP3jPzm9yl++M4JW0LhuXFO8c/xN+afzAQrFUa8+SiLg3UqC/Cz
	g+ql7ePPSBapntXswV/3rD6YrIyEK1nuIXhb/5oXEdAv2ih5Oo7Smu/5Tns74adcv3TxRMt
	M/Ko+y63mHkQ4NZ2gpB7e8ieVr+rwDCoouCrOhnmSRK6CMpOr6FgyKQhH0h0n7HRthSY5iN
	U0QDWTd1PKYoQPboErMGCP1DIJ0eOwMOXFM0l0CHJTrg0lSmdZn/iEjWfunyJZiRxwJQPvG
	0DylASHX+f9+FYNbWQHH1cVxivqujITVVbi/Dv2hJmS2yv+DAu6DJ/Y4UL0wNXd096fIyhN
	rk2BBOXHK7qgR9htyta3jmsfKv4eMoNhapgSgDB9mqzM0QCHI5wNQtyxCbPCXZ/feHIIucr
	VuhzxBe6qd5r9fQxx7gFXr5IG4IBgwSnkDxgd7Z/Qo2neAJMMLSO5M7fDGD8x8WA5l13x71
	+RdUMu+SeDzzt7VcoUx2NGqZamRLo93WQHz9uUr7xmNXNwmYiTM4DhORy+9UsUBHzrDro6Q
	AMVs2WIWtpzFQbxKkUB4JlVdo2jLOvtlb/OPrNM9es7hNn74ep8WicXldYxB7z3Qm2FDTnc
	hHSWJwGuFVn
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
X-QQ-RECHKSPAM: 0

On Fri, Oct 10, 2025 at 02:13:31PM +0800, Vivian Wang wrote:
> 
> On 10/10/25 09:56, Troy Mitchell wrote:
> > MusePi Pro features a single RGMII Ethernet port with
> > PHY reset controlled by GPIO.
> >
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > ---
> >  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > index 89a35914710bfd15c6ad27cd8d0de7ccf62e2309..e9a53dc7a417117c82f3e467677290bdaeffc845 100644
> > --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> > @@ -47,6 +47,29 @@ &pdma {
> >  	status = "okay";
> >  };
> >  
> > +&eth0 {
> 
> For node orders in board DTS for SpacemiT devices, usually we follow
> node name order because there's no unit address to go off of here, so
> for what we have here it should be emmc, eth0, pdma, uart.
> 
> See e.g. arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts and previous
> discussion [1].
Thanks for you point out!

> 
> Also, personally I think it would be fine to just add the whole
> k1-musepi-pro.dts in the same patch instead of splitting it up like
> this. I feel it would be easier to manage this way. For previous devices
> these nodes have been added piecemeal mostly because the drivers were
> being developed in parallel, but if you're going to base this on
> v6.18-rc1 there shouldn't be dependency problems.
> 
> Maybe Yixun can chime in about this as well.
We have talked here [1]

Personally, I think splitting them makes the commit history clearer.
I'm happy to merge them if others also think it's more appropriate.

Link: https://lore.kernel.org/linux-riscv/35C0EFBB84167959+aNj6K33fl7utuqcf@kernel.org/ [1]

                          - Troy
> 
> Thanks,
> Vivian "dramforever" Wang
> 
> [1]: https://lore.kernel.org/linux-riscv/CAH1PCMa35n4dnJ94-EHGrJyU3kztQYO8_v2CkD=rid466zv3+A@mail.gmail.com
> 
> 
