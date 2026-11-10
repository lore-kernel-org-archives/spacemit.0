Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292977;
	b=4tmK57zYF04QsDUofBCSHE1zkbd7PH7ZCHppHrANKUTvuemdVdKp6CmD8IwjGB0f2Ncm
	 eot18YPvxB2dqgHHlQ7F8ElIohN7KP3VxjOnkCkJqotwKgw5fiK058vlFB+89HovFgaIs
	 htOuDtlhjrgMAjjP2dKK+i33dKGpCTHDjP6oS3WniPP+D0eGCCJzs84V+iKp/M4i8P6p6
	 J8PA7jPKHWd22VT+AEUYtefFpO/ILs7nQnFklI+1sqsmZBbQrbmknScYRCjGPbC7jR0+C
	 KD3UbAqR9Evbcip7KKC0pTA2x49B/P9kq7fRiK7eFnyfnQjuUcTaqO/aOxu9h95KKgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292977;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=KDDnULezz0lYOy8E8UC/jFsEQulCu5gvg3BMNhfnq08=;
	b=f6NHLIR2uPtv3Umz3I4h/ZWXCfFJNS4No3E911Pwrk9WXhegvQAbigo2N9WA/OR/hmDh
	 d4Ac7BfyUtR65SXipGDBgSBWe19RYVLDnpUwdByKrKmcSiqwTGrfg1G4SdxbtFKU36qbi
	 Wfb5MMtEL9JtXwIQ0MyyiRHCC786yb+CafqUn80oBgfvxVeWXJ4qqXt7Cve7GLGE1zFNf
	 njVgJF1+Y7mwJ86Z8LwJRHiV8H1A9+eJ6x5+RSGm9ohvwk6jKCqNmOQBpkbrVJpzLaF2K
	 7vK5QvdHe+M1qzT1DVZPmc8ST9f4XQGdT7p7AsqV94mZI0Z1UB5+ECVcobXSOEuDCWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SfTTZ+nW;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2067C606A32E
	for <spacemit@lists.linux.dev>; Tue, 10 Nov 2026 06:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2067C606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=SfTTZ+nW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794292913;
	bh=KDDnULezz0lYOy8E8UC/jFsEQulCu5gvg3BMNhfnq08=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=SfTTZ+nWCSvOOeAwOUskOv5JEMPVZjLIQCCbrbwhyiMgneIi7FR77dN84F0fJcrer
	 GzwtqFl11fTwd3QAxdzT2Lva41y+s4P0waKJTuWDjCxRWp7Xxg6m7ruxxR8RJ4FaWg
	 5/ypBkWJ1doLlZ4hurRBAhIgoLxhwo9cjzlhEmJ0=
X-QQ-mid: zesmtpsz1t1794292906t134bec0a
X-QQ-Originating-IP: oveHQlJZS5x70FgvyEUxF/FxqKq+xrb9z38Pxn3Oj8M=
Received: from = ( [183.48.247.17])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 10 Nov 2026 14:41:44 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4058580149435769383
EX-QQ-RecipientCnt: 12
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=8b303d3f581878ca74b7956765d7a47b0d4702373ae20e17a1f1330f5a6e;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Tue, 10 Nov 2026 06:41:43 +0000
Message-Id: <DMRBR0ARCU5N.1WRTDA5GN4OG5@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Anand Moon" <linux.amoon@gmail.com>
Cc: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Andi Shyti"
 <andi.shyti@kernel.org>, "Sebastian Reichel" <sre@kernel.org>, "Yixun Lan"
 <dlan@kernel.org>, "Aurelien Jarno" <aurelien@aurel32.net>,
 <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-pm@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, "Alex Elder" <elder@riscstar.com>
Subject: Re: [PATCH v1 1/2] i2c: spacemit: Avoid sleeping during bus reset
 in atomic context
In-Reply-To: <20261110061429.2036-1-linux.amoon@gmail.com>
References: <20261110061429.2036-1-linux.amoon@gmail.com>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M75I2DDAzREFGJVAK34Vsh2hoI4LWS+DRTezaCk976dM47Snl/iyjo46
	CwL4ODDoBRITs4ehM/pdaQ+dvbp+H5KF/+NjV632gkX0jJpqHFG6RVU15O1hddOG7EEA5AH
	b3WiV5FPDbHIxURxuKjWhlULWewILpd26Yt3YMoTYg7yQza0jADBfq2Jk74+/WjyjEUl8du
	+oNwl+hyhikcePPslM8dpEZh7sMk3MsDFOG0qpzorOs+jBGoQN0C80VeAdEMUORmKXrajob
	U/09UOk0ElwPvGvq81Cm+TDHcBYN3Pc6YPqP3IwnQQbIvvPMtsrsM9Xp5QVCmFAxFW+OGpW
	8gxQbk4usL9rtWEF3qjRl85/CTMHoDZ32DlAIHTYFvAmu1wRaATybVO9JAJfQm8u4Rsgj/r
	lPRCniGWohwo+DueAlWCZJXpFlb9Jqe+0a5tYrHJCsAVsB7OrtPbNa9H+/xbp1UsW1w2gCS
	aQ1inlizQ+y6soiI5pCJMEv5GH+1NL+jWpDd33udAiM6MR3LUY20jb4RSCR1zLvAbtCZ10z
	0lltyKvYQ+RzrpYJKwEO7H3h2eB6uZh7A2YzfrL6CkgyIkiNrjCAJ2oYWNIQ+68G/f7rYC2
	D04GEkRHvP0UaDRUSP0wLHMbnb4dToS4Zzp6O7VVvXNI0AydwkQOvt4z4lM+kWE7g9sKAqK
	gJj3nwmC56jiBJtl5M7eY29ZYRFHvt40W+0hn0aR3NowcZcNVzKly/jUYnGsUOFNwvPdXAi
	FudLyrG5jUdOnaWczQce62oJAb99e3vXZ5AV1YanBVnLyPhOcTnvem/A6tV6EtlolO11K8I
	Wwv5spG19PShk2dk/d4L65X/1FYDyBAcROk7SU6dNvYFemPr/PnLbNOPRUHeYr0KpDB55wc
	8B2KXwcJt8CSoZ0cNCxYZYNIcMyB+s2Bur3WF8wFGx6dJ6VanZs+kguVxAkw1naOdg+SFEm
	8AbNHfgQAq4ZDLrUJqaS2LkorQ2EHPh0s1cD9s8bb/wcofxBCe5fefbPRlt1qVla4ceqtLn
	/AQPxGS4E9RCS1xGH6sFMAFfsQ9jvyi+rX257gUgtE3uon6MD5jWHpvsAxdDe2IKcOPmjO2
	Q==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

--8b303d3f581878ca74b7956765d7a47b0d4702373ae20e17a1f1330f5a6e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Tue, 10 Nov 2026 11:44:26 +0530, Anand Moon wrote:
> The spacemit_i2c_conditionally_reset_bus() function uses usleep_range()
> to wait after triggering a bus reset request. However, this function can
> be invoked during atomic I2C transfers (such as power-off or restart
> handlers running in atomic notifier chains), where sleeping is illegal.
>
> Replace the sleep operation with the driver's internal helper,
> spacemit_i2c_delay(), which conditionally uses udelay() when running in
> an atomic context, avoiding "scheduling while atomic" bugs.
This usleep_range() was left behind when the PIO path and
spacemit_i2c_delay() were added, so please add:
Fixes: 5dd75dac1b35 ("i2c: spacemit: introduce pio for k1")

Otherwise, LGTM.
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

--=20
Troy Mitchell

--8b303d3f581878ca74b7956765d7a47b0d4702373ae20e17a1f1330f5a6e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavK8pyEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC9IdAD/cSnhy/8EVYiM
iOg2ZBk126QEPmIPly5ZvxvY7dIXMt8A/3F0j9wcXPKP/DGUvY9SzSto1m3OYAr8
vnOgFrFuFiAE
=GBnh
-----END PGP SIGNATURE-----

--8b303d3f581878ca74b7956765d7a47b0d4702373ae20e17a1f1330f5a6e--
