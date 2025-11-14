Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B00219AD5C
	for <spacemit@lists.linux.dev>; Fri, 14 Nov 2025 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127274; cv=none; b=k5IvCEkgGt8cQi/CpQ17hBmIIciF3wK8zZvuqJ+S+XkE3NVpl3M/gD+faQEYlLV+gNcAQUEiqErgZ2vu4cuGy1CtKNoV64DVRmMtdKZ4CyvLxyttuKEnTz3m76saPR6wqrRptEF7V33s1wMxIaTP8bAQDISYQWzKZKI3HiKnib8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127274; c=relaxed/simple;
	bh=NYO4lBKbAWnhHJdfNeAdX8x6Fh5jSfXSTZP+Mwdw2Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AseowGZc8xMEoKN2O9JuEKGPx1zd8FP1WwZYv1M0S6M7zXW50g07eqKGzV87PD5eu9MgE5ZuYVENIE6vY3DlH5z+Tq0IiG4rwIQSTGPIhdcO3Elyzlu7bb4PgfzIKtQnfovIyBMh+EDbpgrf7I9BcG3yhgZVJSe4/lzF7XKMUQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Bku/JWfx; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Bku/JWfx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1763127242;
	bh=VPD0Un9VCoiu/ZV1KP2Lboih+blDxW/s8Ai4q1ClHTY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Bku/JWfxULtP+UUdaUlKVyNA+gz6nCBe9fhxl/QIIt5ZQdrv2fXeffpxVlhjDbAFq
	 J0+t10rA+w8MYp2GzU0nFfju6hG9QoVUsmQpZ0QJsJXdBg2oZmMQnhBg/hfJRNBTmL
	 rJjSCS4vIwFrFPT6ISff4FbY9qcXJ58GCZSbnkl4=
X-QQ-mid: zesmtpgz9t1763127238tb19bb4ed
X-QQ-Originating-IP: 3EoJsFn8/+w+Basw7ZgGnaNz8HyXJ58kswZeQ+S0/0I=
Received: from = ( [112.92.71.152])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 14 Nov 2025 21:33:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2921056434625684428
EX-QQ-RecipientCnt: 4
Date: Fri, 14 Nov 2025 21:33:57 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [RFC PATCH] riscv: dts: spacemit: initial i2c support for
 OrangePi RV2
Message-ID: <BF4752787F870A9D+aRcvxe_rNthTxlUn@troy-wujie14pro-arch>
References: <20251025074514.642357-1-michael.opdenacker@rootcommit.com>
 <52bf454f-424a-4824-a3fe-339d411bd664@rootcommit.com>
 <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4544207DE7959B10+aP7Ieuaw16uArne_@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MrXWwK2gDZ/aRXSvmQ/EO19hjFa0un9MRuWWzCp/12gt4UOTGoyHgVYq
	mYCEoy5qglYVDdnHnWs8rggMH/j5cXEIEkyXglGO3jLmWvCq8qrRRhKIcgHhcKjstlCprZR
	zcZtlfHIYEmAnZyHLWXamfbk6raq7fL4EtbXqCMHnCrCeRoFhfusTNif0RSMjrqAG/mNdtx
	yHbpeBQwy/vzPaNI7UmM7y7FvgI1zXDMqJA9rddtvl0qph1aUXgWgc5/bXZcyLGQp6vDsoI
	I/KOX0gjg0q8yx4IqRBCTBcts7pbxUr4QNLWiQJfpNUmiMw0qAAM4E4W3JJ/LSjab5W1bGx
	uBitdXGAEa44SxMjiK0uNTqc2vdMtx/b3EIkAdpxt0kLRCLVKt4viWnTyRkp+JbMkTOIOiz
	wmZpse0dUaaAx3O0btBjL3Qk9wdv5Vo6KE8EmbMt1w5rg0WGapWmX3Ds+q5IGt3w/XSi3aj
	1vCX1Quds1xM7mETMiE+O5Wb8xGxagKkz842sywcaTXGjvR9jHB06cAeHfzE1epEWSskL5H
	stwlEleI3S4KfQ2Invr5FWhFEajWljg1d2EcX3fhAy4ynCP0XP2P53rRH2VfLOEyB7+Ghx7
	DeEKlHxIAGQMmXVNRm6OOGi3dHNI2PMy3cUYgBdt9BuPidrOSPmMwxCX5vgqFXO7SH2OGjE
	IBZwbn6sVmhI9uq2rJ3AE3NkQR9q1SLgMq2v+qn/N+VHN2RBH/y/umQCVxEhlWcRRyOycX1
	nnCTQO8oEMRmJwiAJnEoy3Wj2cG+f8Ku2pmfYckEjwPvrOQFqAedcZGSOg8rCg4XQI0Sjir
	I3Pkr+0R7Krr3xMHl1sVouUvdVGB0pqpFR7a50MqMEOVBbnRUm7kn0cCzDwUoovaVtM41XU
	MdNTlz7fiN4OppL4xbHeUyZDzmVl3/BQK8xrW7P5INoaXlBbeyykydV/1j5KwX3eMS3A/Lp
	Bir3fn5gMNmhLCAuXNzkfU1rZtuteF2deDzCNxPFtrWBIx1EvRAsn4vGFbHnCRT85gRdOCX
	ZMnO36F97toSmqHFal1E0p/aH1XzAAk4uQx3IXNBCmSvQXhdDw7xacaiOPybAimznykeU0+
	fBgfeqva1jFOLEfMPrwb2uZ1P1uQDH0EA==
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
X-QQ-RECHKSPAM: 0

On Mon, Oct 27, 2025 at 09:18:50AM +0800, Troy Mitchell wrote:
> On Sat, Oct 25, 2025 at 07:48:45AM +0000, Michael Opdenacker wrote:
> > Greetings,
> > 
> > On 10/25/25 09:45, michael.opdenacker@rootcommit.com wrote:
> > > From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> [...]
> > > +&i2c2 {
> > > +	pinctrl-0 = <&i2c2_0_cfg>;
> > > +	pinctrl-names = "default";
> > > +	status = "okay";
> > > +};
> > > +
> > > +&i2c8 {
> > > +	pinctrl-0 = <&i2c8_cfg>;
> > > +	pinctrl-names = "default";
> > > +	status = "okay";
> > > +};
> > > +
> > >   &pdma {
> > >   	status = "okay";
> > >   };
> > 
> > 
> > Unfortunately, these changes are not functional yet on OrangePi RV2, testing
> > on https://github.com/spacemit-com/linux/commits/k1/dt-for-next
> > 
> > # i2cdetect -r 2
> > WARNING! This program can confuse your I2C bus, cause data loss and worse!
> > I will probe file /dev/i2c-2 using receive byte commands.
> > I will probe address range 0x08-0x77.
> > Continue? [Y/n]
> >      0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
> > 00:        [  124.675321] i2c-k1 d4012000.i2c: i2c transfer failed, ret -11
> > err 0x400000
> [...]
> 
> >                  -- 09 [  124.686769] i2c-k1 d4012000.i2c: i2c transfer
> > I assume the i2c-k1 driver works on BananaPi F3.
> No, It doesn't work on BananaPi F3 actually.
> > Any clues why the same
> > buses don't work OrangePi RV2?
> This is a known issue.
> I didn’t fix it earlier since it doesn’t affect functionality,
> but now that it’s been reported, it’s time to fix it.
> I’ll send a patch shortly.
> 
> Thanks for reporting this issue.
Fixed here: https://lore.kernel.org/all/20251113-fix-k1-detect-failure-v2-1-b02a9a74f65a@linux.spacemit.com/

                 - Troy
