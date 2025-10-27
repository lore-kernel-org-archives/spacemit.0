Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA57C2874FB
	for <spacemit@lists.linux.dev>; Mon, 27 Oct 2025 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.207.22.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761573252; cv=none; b=CzDhlUxhNPdqKMUCXj3NCz+fMGC78KNS4e+W04fhV8G94t49LITP9f0HjBjulNuJjX08S6DlSFd7z3jWDDSVmtQZ6zM5XDrYXWzUZonh7Cy9VeWEjdUqt9ST5KIVfq23Zr2VuHZ+wOIzkTF+ojfaesdrxjRh7txTxn2VlmVzD8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761573252; c=relaxed/simple;
	bh=mKZXgmC0J5LBgztr81FWGG2KayDzmjGl5hVIlR61sKk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gHdMIL4zLJLVx+6sEUz6b6jjMNErtuyAIMxbhQx/G+RsDQj9Jwcqz7mUXoa+4nVU1CqTmJ3BRNqyEOyZc49RN+ZXHWgLBjGXPPte1BHABAvZdMEMnbTYvBzgTZ+4bay2taIdQoM0vFesH3MhBxyXQa9Qfwzpb4FedTxs8IaOFj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=oSjrzR/Y; arc=none smtp.client-ip=54.207.22.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="oSjrzR/Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761573157;
	bh=3kzLSOuCsNwd3PzYAldLRKtwAf4LDDOP8IpojHoSDqA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=oSjrzR/Y31GQ8Je2z2krqEdS/g/jxabnCZS1DXdHwX0JKlLy1K+Rn3eVlg24KZ0SL
	 I4wBxxiuNl7YjUxf0/nqcpRKJnP+S8VwvSIV81q73gH8dYPpA+Qd5DcU+0DnT9lnz/
	 3smiuUg4bTCGjmiHSfcEIPlGoobkOXgYK+HQ2sms=
X-QQ-mid: zesmtpip4t1761573148td27e7fff
X-QQ-Originating-IP: UrvBgtWjK2nHPKDaDc+5eztGAGq+puoGJrqONWDB7do=
Received: from = ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 27 Oct 2025 21:52:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3589194371110630699
EX-QQ-RecipientCnt: 14
Date: Mon, 27 Oct 2025 21:52:27 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-i2c@vger.kernel.org, linux-rtc@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Message-ID: <DE3BC758D99A2110+aP95G3ppc_mZaDpq@troy-wujie14pro-arch>
References: <20251027-p1-kconfig-fix-v2-0-49688f30bae8@linux.spacemit.com>
 <aP9IVckJT-k2_O4K@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP9IVckJT-k2_O4K@aurel32.net>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mh0xRtMdhgZRanLwuwAVcqmp1P5pal50KAfMbD3eUBhbrg5PthVOPmEf
	sGCN4jmRdbbe5xpLy1i2t+h30110rqU3JDOIWeHHzRRD60R2HH+2BHxviT2E0WSmyEwlnId
	CC0jO8m1mZ/IBWmmc5+6nERrwOOdw+eHvVboDE+E2Gm21uXExF9vHLiV+62SCxpZBFp6nKF
	onSpJLykJBQnVJ0IglQ/pe+ngk1wkw2+8N76DVd7W0c7Ho3ak2oxLpgxRPowcq4+9CPj9/n
	6DENo9CAn6S+3yrMXpnuQEZEGeY6BY8fo12HTF7vKHq4zkAqOnoNgj1igiwpVhxhz+zWtw5
	1VApAhZD1W80QnYqz7ZOJOx+v/RT+RaA1SRjUbRJbmSUOBfq4TcIdp8DVGMLsErq79dlGeN
	8Pu26+hhV1+YTtJpLOuGNRhsa7PFC3/y8l9+ueD3dPVxcFZ4YX0rP/jfK8m0Jk5TQsh2M4n
	R/G9DGS3LvBzj3nzlcJfVvgOk+l+LZCiSsGOt/GHQg6ec2NjBL6Xuj3gviWnnmviyupOEVN
	qzqUvYy/NAhgJ6HwNQ+Jqqwtb2P6Q0hp/DpFW+Ke+SNCnuZ+eNZlmLDcrymbM1KUHV9TxYf
	RHxFbhLw4KD3V9xzNNz22a+HfDST0HzhMQZi+YCDdnkn1io1r3TybjQCCHUCiVE4+sIV69F
	V9sO4pIRinHvLbIj3x9WLT6UWl/z6rLx9SgEgsIHYr1qoPbT1nMaB/VprXxq7wKKH2gjU0I
	/8E6NLCir7Of0PZiWQ/rh7EeqD3/N2clFkDdmC8FWMcevvrWI41xAdUfZPpornXRyM0+sfD
	bWptv9DdWT/yo8yi6o0Lbjreu5OT8XKxuwpdtsSDCO1A8/IU7yEUD7wtAj2lYe3bO8wwhxG
	1QgNzitFphMUzcFKn1efkit0E4kFrfFKIsaVIOuJGgUduzkaZIZG0ovBhLx7ZDphrJunTNm
	oe8aYjAEekfdG7ZLnjm1e9GGvqx2gqgZuEAmsyn76Twb71DMFzCIGFruu3YFM237WIsbk47
	JheZa21s+p/n7/YhbEVzJavzd0pbtJdyKZGF/yrzAkgzn5jqpMBD7pemfRgH8ivUMbcbL9B
	CQTufCOfcne/7aJsNllQ3asTFYIBG4Xjg==
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Mon, Oct 27, 2025 at 11:24:21AM +0100, Aurelien Jarno wrote:
> Hi,
> 
> On 2025-10-27 13:48, Troy Mitchell wrote:
> > Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
> > merged, the driver would fail [1] when COMMON_CLK was not selected.
> > 
> > This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
> > patch has reverted by maintainer [2]). In addition, the Kconfig for
> > P1's two subdevices, regulator and RTC, has been updated to use
> > 'depends on MFD_SPACEMIT_P1' instead of 'select'.
> > 
> > Link: https://lore.kernel.org/oe-kbuild-all/202510202150.2qXd8e7Y-lkp@intel.com/ [1]
> > Link: https://lore.kernel.org/all/sdhkjmi5l2m4ua4zqkwkecbihul5bc2dbmitudwfd57y66mdht@6ipjfyz7dtmx/ [2]
> > 
> > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 
> I think this series misses a patch to add a default value for 
> MFD_SPACEMIT_P1. Otherwise it doesn't make sense to define a default 
> value for the ones depending on it (RTC_DRV_SPACEMIT_P1, 
> REGULATOR_SPACEMIT_P1).
Yes, I forgot that. I'll add it in the next version. Thanks!

                                  - Troy
> 
> Regards
> Aurelien
> 
> -- 
> Aurelien Jarno                          GPG: 4096R/1DDD8C9B
> aurelien@aurel32.net                     http://aurel32.net
> 
