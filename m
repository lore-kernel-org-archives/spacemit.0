Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491971EBFF7
	for <spacemit@lists.linux.dev>; Tue, 23 Sep 2025 01:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758590807; cv=none; b=Qu19YLqHr3BBqs43Npmr1vyDpSNz8wegLMAmGeezhejBnp1Fd0ZJdqyxoK2z6N42jKzQdk5roYU9CdRfwHWlCjTSaX6IO9XSJvG65xj8Hh+TFQ9GubOmom/B0KKD/S1m395sZWvDBXinkUusW0HanwenMCILxyE/5TIYN1JSczk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758590807; c=relaxed/simple;
	bh=2SdapVLyaGozErlxBMqjA22j/jsmcGdm9cQJQC1/wSs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pv0FLUJzdX68Gql7i8pKMe82Y664O2s1pLwsHD6yQ7MDOY4SVsgfFA6z9FTt6aCO+QgenXRwwfFsrDQZ65a8h5zj1XEYFcETJydpE5D6SftW1xDQ5Lbh17vACcBiwSEUli0BIHfu1d94cNc3fx0RjQ9XLKHef/F3Ng8b3Mto0Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=hQeNyhT4; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="hQeNyhT4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1758590666;
	bh=R6prah68ZfsjQK8AywOG//BbF1v70nvv1zMUrmZX/8E=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=hQeNyhT46gkfO3bnI56SB6u78IRu68NE58IEzQsgFdoYfkXSnYaTFj8+Hg3egr7vI
	 UWgGVfXbRl4I9xLPA2uru/kCoNhzyNu/6OcUrpqHZKBGBUJboXai1rLbkeQZuM6D9c
	 gDCtAZl7UqCxwV703w/ct6UiaK/6r4HCVUuGPAW4=
X-QQ-mid: zesmtpgz4t1758590658t70792b8c
X-QQ-Originating-IP: ypD+x98mMo8iv/gr1uyYUH6f16wbGEITxjk+nMZAZus=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 23 Sep 2025 09:24:17 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 16270214164439239455
EX-QQ-RecipientCnt: 9
Date: Tue, 23 Sep 2025 09:24:17 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troymitchell988@gmail.com>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 0/6] i2c: spacemit: fix and introduce pio
Message-ID: <A945B5CD89E60F5B+aNH2waAtt6LNTyMl@LT-Guozexi>
References: <20250827-k1-i2c-atomic-v1-0-e59bea02d680@linux.spacemit.com>
 <aNG3xXKEYvhGfKjb@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aNG3xXKEYvhGfKjb@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: Nti8seFhgrHQ3KIf5FY7llxF8NbsOqYvTjKATxq7RDrtzLDJUxmGZYpi
	NglzeiPmIseKqlYy1kK4RCaNyyI/iHaseVwYXT87+c9peHjQifsWkPRhkh0UCbtJk/k9nk6
	hh5WQz/Z5ZRG8BeVHaM8RVnS16IQH/zMxmQan15MY7IaZCFnOxpY04R9Lg9EPUU21Wv2F8y
	3l0q60nu/bMArXFMTMU88Yi/PKEmru2NkCLrS/XkSqVIkoaR16wtV6t0cGY0tjq9080MbEb
	0TxTNlauhV1+/JNiT+Q+76Kide51Wzq9XSJ6HnzYfilx2o9z8YZiYU9i0+zf0V7pV/yGk4t
	EE9PEUdeBVHXF7+PiP011+DJbMC1NdbaBmr95iKqp3r/c+SL3sG4w5gEZH1kTOiC5N8xY55
	KJ7n8lIT8f6zgp1Za2Jru/OL2tue+siklVP4qhmrOSeKCwKC33nTn+ijj4b5Zw31oETUDp2
	2r7XWdYLuYM4gfHcnSNVoSmwpCPdIO4WmMoYjSs/dMvjzeGACARK0AT754qa2jiNKshaazV
	QK1d3oJr0QgNQ1U99bG9q/g4uZT7W62ISi40sM5xdLtsmrsGX7CV51ygWbsrDWXWkgn7Wjx
	81gi+iyqCuBIvzLCkkcY/Tez1DT0l2UO2c/3lwhJV4p9qrN+X0ppb/b1G6MiV8hLxNdig+f
	VG4uMH7O0C5eElyQL0JU05iXg0D1QwQyRGk3J/U71Bs/h5+8w0tAoTJDpIBezZZCMYIQ9dp
	8ZOqESgI/spjEMsxTR2cGUOmCc/wuDPYIZQ9+3T1KD+yUAwWLIIwREkENz5hZjhsAMfX/5I
	Vz2QKj1kY98EdSXT21WC7LXs7XslZU/Hvmz9Kv8pFhA1ZVC/VLiBBBoNXAZedFrDhdppIBZ
	7xLpQhQgKqbJp+VqHFhJh2y/qEDG58T9P8HRhTDPun9UfMmu7xITGnOH7VKOzEXHfV2z2Fx
	tPRL5Ho0L+f5rsrFbctBZAXpoNgbQAf0tAo5IRnIFtigJb8wc9ZFDp0FdsU/3U33azkAKnO
	3/bImdf77glYoWkzieKaQLNipJnwMqaS/D5ecuHqgRfcTFtgqHKHggnJo91v6jJBTuoHwKA
	hUoNGEyTjy036iJha8zm/5dC0gkTvKPzlUCJ95LEB9j
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
X-QQ-RECHKSPAM: 0

On Mon, Sep 22, 2025 at 10:55:33PM +0200, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-08-27 15:39, Troy Mitchell wrote:
> > Previously, there were a few latent issues in the I2C driver.
> > 
> > These did not manifest under interrupt mode, but they were
> > still present and could be triggered when running in PIO mode.
> > 
> > This series addresses those issues and adds support for PIO
> > mode transfers.
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> Thanks for this series. Based on it and with the few fixes suggested in 
> the individual patches, I have been able to write a small power reset 
> driver for the P1 chip, supporting reset and shutdown. 
>
Nice job. I'll follow yours. That's what we need.

                - Troy
> I'll post it on 
> the list in the next days.
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 
