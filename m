Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D4F22258C
	for <spacemit@lists.linux.dev>; Fri, 10 Oct 2025 06:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760077506; cv=none; b=o9vzCm7cih8thc0kkrSjlLD/XNPQYx07HaXtRZ0Jgz+urKHOwhF7xFYmvg9kWhAsytYO3gl5YJ3Vhc14kOo0oDwdSA1w3S7nKp9WYNZzguTMPR738AmpcbncfmCViHJCwm1loywIbNTQFt8FsW0u0LkKtaZ4DMdftckTL+ztzfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760077506; c=relaxed/simple;
	bh=n4JQfOCqPr0JGIkT2Rm/zXjjbCyikPgal54EzZefOzk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TRl/trGdsSetDcDnTNsBbojQPx9WXMlooMNJd47PSRQFXwxw13r3WRFEFrDfYL0IVe9bTJYdxkNzXnWzPf5DkIwG7NUtlsRLpaft+gt9Y6xrEGeBlwwMU3+ZrgnGzZDAEYfP5n5Cw9LoqQoc0OZ7wPNFdgCZ3E9FCQRt9P/xKw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ZxnZfrlu; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ZxnZfrlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760077399;
	bh=tm/lUilTBDw6IsADQJ8KkEhhEKSkPxGsACAkHAwgEOE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=ZxnZfrlu/HmH2kW00Mo6vKjneLX4/OgS3i1OavtrcXxIig2pCvkM7oDQoT+4rQ+E7
	 8QoZKFpYlPUsS4gF1Usu9grzeS04glQdt0ud9iz21s9g3lIw5Kb7WkwdtD+RzFLjH9
	 rsK0igmeuUQ7L4yqW8PfvI1iaj1RI6OvC65rLS6M=
X-QQ-mid: esmtpsz21t1760077390td7701a8d
X-QQ-Originating-IP: oxK7XddsRt6IDGptzNKloTsRDPkLDF3OKx8EF4ZwQ8Q=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 10 Oct 2025 14:23:08 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14211931734184312409
EX-QQ-RecipientCnt: 15
Date: Fri, 10 Oct 2025 14:23:08 +0800
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
Message-ID: <08298B8B17A59AAE+aOimTFhG8DqrtfH0@kernel.org>
References: <20251010-k1-musepi-pro-dts-v2-0-6e1b491f6f3e@linux.spacemit.com>
 <20251010-k1-musepi-pro-dts-v2-5-6e1b491f6f3e@linux.spacemit.com>
 <a02aec9a-976a-4b63-86cb-126b8ae71185@iscas.ac.cn>
 <f968ca77-6fc0-4485-a13a-2ed83a7e6617@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f968ca77-6fc0-4485-a13a-2ed83a7e6617@iscas.ac.cn>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: MbvU6/58K7Xo6ckxyJYt254pR63bN5OGr/OYJBIWzUP/oxpionKY/0v8
	1xvvmkOjlTdRp5uzZNWx5KyvEgAKL3W9G0ZF3UvmSZQqjm1QVAiK0tKRkVw2O7SBJVoBAHr
	Hu9DB4BV6wzIe94L4xBDsL0uqYHT13tEpDcaQKX34ZWPOHn7xZ/DM9BJHkFM1BGNe2CXiEC
	8wbNMZe5i6wLHdqaIQiNNdD+zmEvWChBFnezeFPzv4jkeyMh2/tUPSWPvAAkFUdVO8Adjrv
	tLVrtodz5e/z55bREcfWuQTF/7SEbngnEreCs7p5I9BgZPvFgCURVIZOZPtbZt0s3bkiMhA
	Et1XNcXx40rrmK/9ajs0VonawDvZ1AvyEwOojz8394Ap48oaNnGzp1T+A4q3A6WetYjdeJY
	+rJPXIyt6Mq8PDleMtM4YXpwB4XIw3mOHxzfnbACCvC1lRP05INgsonK9kywNZ2bUEoVBK2
	dDFCVADdhnWGq2p7wt3j9ztl9wYbb/qQp5+Abfn4j6hLCUiTxu788K3UIuj3CBXvnYet07c
	hRvpHUzV+A2Ho3cNk98aCsrCq/R/9SsSlUZBCK0QrAaHTNjahzcN4sATnr5pEiL+Jjjqt+j
	4/N0wbNZmr/NKWiRhHwNGKlhRNT/UCLX4ToUOlawHf/3ejDP4FFoAtUrnPEUEJPbfNYvF+F
	A17fJO/soeijGFwe6l8j6deY+quDhiYTnOfWA4RGD8suC55AjpYnVDC1AIpwW8BeSi3wtM+
	pdfoXXr8fYgnLal3iz/ozOPN6JBlT3U7RGpI6IOQAZQl7Ryo30m/i0OARuDllZITOUfUBTQ
	GyYnD/Jot3zjL3CFD5DARL4jVPCahATzHx5VLoA5S0OQLuMmiT49c6A7CxmU+k9ZdenD9MJ
	lOPJREmhoAOOmx2sk/bctj5OnaZg7bMo6837l+OnG/a2Lt56FWrRGKYcyyghoQpKpSjrWeK
	Bjxlh8eJDycLSrxql5AwVP2rE3fPwQggD4fzVz3jbS5nr+LxIPNCPH8F9XZmG+MvhvSMK5B
	W2Q+QHwIehpMQJO7dnf7qoS2xkQuhV1i30CPynZvR42Yb+KSUEPFG62CPWoCdB+yq+2owhs
	jp7QI6Lvb+nWPMfbS2q3EodYCGB52ntQd09mMDDuya/u7Go98uW2Mi5FmeKuXTzQA==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Fri, Oct 10, 2025 at 02:20:50PM +0800, Vivian Wang wrote:
> 
> On 10/10/25 14:13, Vivian Wang wrote:
> > On 10/10/25 09:56, Troy Mitchell wrote:
> >> MusePi Pro features a single RGMII Ethernet port with
> >> PHY reset controlled by GPIO.
> >>
> >> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> >> ---
> >>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 23 +++++++++++++++++++++++
> >>  1 file changed, 23 insertions(+)
> >>
> >> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >> index 89a35914710bfd15c6ad27cd8d0de7ccf62e2309..e9a53dc7a417117c82f3e467677290bdaeffc845 100644
> >> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> >> @@ -47,6 +47,29 @@ &pdma {
> >>  	status = "okay";
> >>  };
> >>  
> >> +&eth0 {
> > For node orders in board DTS for SpacemiT devices, usually we follow
> > node name order because there's no unit address to go off of here, so
> > for what we have here it should be emmc, eth0, pdma, uart.
> >
> > See e.g. arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts and previous
> > discussion [1].
> >
> > Also, personally I think it would be fine to just add the whole
> > k1-musepi-pro.dts in the same patch instead of splitting it up like
> > this. I feel it would be easier to manage this way. For previous devices
> > these nodes have been added piecemeal mostly because the drivers were
> > being developed in parallel, but if you're going to base this on
> > v6.18-rc1 there shouldn't be dependency problems.
> ... and also almost missed: this should have an ethernet0 alias. In the
> most common boot flow it's read by U-Boot to set mac-address so that
> both U-Boot and Linux use the same MAC address. This allows U-Boot to a
> persistent MAC address rather than having to use a random one.  
Yes, I forgot to add that.. I'll add it in the next version.

Thanks!

                    - Troy
> > Maybe Yixun can chime in about this as well.
> >
> > Thanks,
> > Vivian "dramforever" Wang
> >
> > [1]: https://lore.kernel.org/linux-riscv/CAH1PCMa35n4dnJ94-EHGrJyU3kztQYO8_v2CkD=rid466zv3+A@mail.gmail.com
> >
> 
> 
