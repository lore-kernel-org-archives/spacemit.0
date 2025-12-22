Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA9A1E9B37
	for <spacemit@lists.linux.dev>; Mon, 22 Dec 2025 09:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766396172; cv=none; b=T3cZ9qw3br9MVlTUKHyIFTs7pGHcXy6CK4lqQ6Fs3AyBL8+NnRaRjRUl40adj/fP6YAVa2Y0r8EOahPRl6QKOgeTnjNyf1Twnp8FXgGgPvCwPM8HzPlosxkQv4jOnOGy6a/vZJF3S9y1z0Db7ReSa/xSGqvZxEMfXvR1vr09pso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766396172; c=relaxed/simple;
	bh=HkhjCZrne7qQJahedWxiCLoh4aOir3xN7KC94v/fQ40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jtutwqaMc4wfm4Wi3UgP+bkDgMz1HmoBE39fbkdBAd0QW+NRw/6tnqgfy+Lcvj4e6qfHnir/xXSSAnjqkIMhe8daIIBq+6pNaEyT4QdxFo/Wz140inTtdFmp6X1nMx+SfoZXOTCD/6i9fMiPFhrAWapMLjd184ROyvmBgvyzgJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=FeQN+0iv; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="FeQN+0iv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766396164;
	bh=HsbEwL+a3ehQwaqo4UIyfPjDh/hFR3Gu+Q/uCtPiRcM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=FeQN+0ivvzkZvaMy2YHQO7aBztQanzf01RZheYchbmsZ3KefH6IUtP+u6gBpaEIFD
	 oEqpS771fF0mK+wNMPJbUjfEelNpJRcixXjD4gyIAuG1AH1TTVYBXTsF46AUDD01Xk
	 n3pP33SbV6eUGWvtOtf8Qr9sINXowTPUZ/oiMKYc=
X-QQ-mid: zesmtpsz4t1766396162te0c85235
X-QQ-Originating-IP: rk4yZ8PstRgyj0RWzoU0G3baXYfMJuIshSlWznk2Z4g=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 22 Dec 2025 17:36:00 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11526639101067456687
EX-QQ-RecipientCnt: 16
Date: Mon, 22 Dec 2025 17:36:00 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, patchwork-bot+linux-riscv@kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	tools@kernel.org
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-riscv@lists.infradead.org, dlan@gentoo.org,
	elder@riscstar.com, andi.shyti@kernel.org,
	alexandre.belloni@bootlin.com, lgirdwood@gmail.com,
	broonie@kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] fix the SpacemiT P1 Kconfig and resend the K1 I2C
 ILCR patch.
Message-ID: <5242B57B5E933BCD+aUkRAGxI5ABW-s3O@kernel.org>
References: <20251118-p1-kconfig-fix-v3-0-8839c5ac5db3@linux.spacemit.com>
 <176613181654.3684357.18070317581817603415.git-patchwork-notify@kernel.org>
 <20251219112634.GJ9275@google.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251219112634.GJ9275@google.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ni2ZB8mfJmbFvyCBzBMDPa3xCFaq8m8z5niqr8vjx3twsaaCO18Mq4WP
	XiEeMRNFHxTdb/oa3Fn3QR27dZcs4VXdxVYQB9r+kQWF2Ir2QXY3t2qKt+x/eH+Cj5OFq4e
	k2iwn4G2+9adPInhNAygcFdZQOMwR6kZaicOdueI83a+yIYD/+VoilPJgOnnYMd1mnBcAcv
	lan64mvYE2QHa4EEWP/d0H6d1Vp2cP0OoM5edMjN1LrWCMDbSAWlMOOHbiMDL5g5kNsZanl
	BZ7K0DN9PKb/6YIIfCeJJdbSLIYF6AMH86dZhs/oIZTwHMlXH5tb5/lAURDjRI5WefsbYfk
	R3xtx3SiRWvrrd6AnAWckR1bOB679F5j/SRdBB5T8ym/Z1cSu6LayU110IV8JVepL4HZ51b
	gKnaAN7IY229Sa+xvoOVNsUXSgJGd5UXUKPmbrzHGB3uFKjKQaQI+TwfF3LKjPhkzg7rKcx
	YMp8tJWY/lf+Dhq7EPhtNwEDBAbrtze4KttJxBpetXuxiOkt1nyDhI9oprbhnqmnC/bviCH
	QF6xOH3rlhjFH+HJSAiFB5iAca15p1/jbLCY0fO2qg3MKmUtLnhkn20LJTdH5CaWmk0G9oc
	PU6PRt8n8vohhOxZ2iIskf2+kPDTu+uGY4Y4x5PaO0V9SCArNPdazwvq9KnkcLpmwSlgYTn
	htkhp3zgQLW8FFy2o+IXUO5vxtda3IBZEVrbVVyBhOdBKM3dllIox9uuJ7eozjBlgXS3uzP
	PdhK+7fzz3RmXi2B5WMV/2XIKPLNEKcEnAzVpgOmI3Oumm6AH3FIbzNPLAvfJk/OGplxuhF
	iG5ZyvLcxahybtQrX1WOFI+Jiqps0PoAAHVness1f6qv5cHar2u+uNRHK3Tp+P95BBFys3h
	QFH7wo59ARAdYZqdaqSkLzPsADzinVBqFvOnkAnlUi/ZYALURzlrX+PjgeGv3CvdKhxWjJj
	Tby7gWczR+sy1KSJIg8DUTEukG4TJo+FdacWqg/qdJkYtw753sqOGOaw1opzeFUwgeox2sp
	QKKGEp2ClmyZhxrIAjKLMjxYBPsxi5DbdRKBsyfefo6AqAXcn/lhe+0cDXLEz0ZCzJD0TV4
	WcguwXD2aZ2xT3kZNTH5Mt4LvOGkJ1KenvJ7nH7HYG+
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

On Fri, Dec 19, 2025 at 11:26:34AM +0000, Lee Jones wrote:
> Hi Konstantin,
> 
> > This series was applied to riscv/linux.git (fixes)
> > by Alexandre Belloni <alexandre.belloni@bootlin.com>:
> > 
> > On Tue, 18 Nov 2025 14:08:04 +0800 you wrote:
> > > Since P1 Kconfig directly selects K1_I2C, after the I2C ILCR patch was
> > > merged, the driver would fail [1] when COMMON_CLK was not selected.
> > > 
> > > This series fixes the P1 Kconfig and resends the I2C ILCR patch(This
> > > patch has reverted by maintainer [2]).
> > > 
> > > Now, P1 Kconfig patch has been merged[3], so I2C ILCR patch can be
> > > merged as well.
> > > 
> > > [...]
> > 
> > Here is the summary with links:
> >   - [v3,1/4] i2c: spacemit: configure ILCR for accurate SCL frequency
> >     (no matching commit)
> >   - [v3,2/4] rtc: spacemit: MFD_SPACEMIT_P1 as dependencies
> >     https://git.kernel.org/riscv/c/16bd954c9336
> >   - [v3,3/4] regulator: spacemit: MFD_SPACEMIT_P1 as dependencies
> >     (no matching commit)
> 
> >   - [v3,4/4] mfd: simple-mfd-i2c: add default value
> >     (no matching commit)
> 
> I was just about to send another snot-o-gram about people picking up
> patches without the correct Acks, but I just realised this is the same
> Patchwork issue we spoke about a couple of weeks ago.
> 
> This formatting is very confusing, since at first blush it looks as
> though the whole patch-set was applied.
> 
> Please can we only list patches that were merged?
I agree. At first glance, I also thought the entire series was applied.

                          - Troy
> 
> -- 
> Lee Jones [李琼斯]
> 
