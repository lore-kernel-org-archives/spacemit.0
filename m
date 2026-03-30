Received: from smtpbgau1.qq.com (smtpbgau1.qq.com [54.206.16.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD493815F2
	for <spacemit@lists.linux.dev>; Mon, 30 Mar 2026 09:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.16.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774864278; cv=none; b=DYwIW1GIWwRJG1WyGEyTfX+VkYNY27ony1lYP9NruIJ08iVOWJlp7ImlMSwmiHsnobgZ2ftTU+L1ft0SdDN6yDF06t8uUdamgDsCkPpuFt6xk8j2DnCOhmBOZPAuAvY2ZGBMo7WweZ5IS8bhQS5zPJNUiHRjtY2wRHIvSEzGLOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774864278; c=relaxed/simple;
	bh=LIqtJ48k5B5qj9wUOqYDtO+CqGQ6Z87zu591S8O/XKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEj1vLCbGQAE3v8NCWWCtne10c5ZBAdxgK96q21rQB4LNL3WNBP2o37c9QsikWyqS5XWrqEPKdVfW9cYSCuFMrhs3/ZefC/UIE6PAH0KbyjJwzeiiIuyBr3HUSKak83JdUBxz8CNW7FvPtM5iNbIhNseL7vPr9dIAHBlgH0RiFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=TzbBmVOO; arc=none smtp.client-ip=54.206.16.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="TzbBmVOO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774864214;
	bh=0cWBBv5rxgLi6P63en6zZ1oN58vmhNFhNRu5bv//9ds=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=TzbBmVOOd4OuhaSB6XZ/gsmFBEsbqbKokUrK0cpecxDyqshd07r6xAg8Ut2FzfHlV
	 CF7dUcPzLJVB9C1cbOBtTG1DCxJfbLu317xyb6/WmwHAxS8uSpQEBJC/2pbNN0z9oZ
	 SGu/yIW8cxlN2SIJV/r0KkraatYEUWcjCd0QT8Kg=
X-QQ-mid: esmtpgz15t1774864212tc3579899
X-QQ-Originating-IP: kgQlQ1AFTdcKJCPfibdkLFsW4QhvOKwrkiwIr5b07Bk=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 30 Mar 2026 17:50:09 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10393731450073565107
EX-QQ-RecipientCnt: 13
Date: Mon, 30 Mar 2026 17:50:09 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: spacemit@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2] dts: riscv: spacemit: k3: Add i2c nodes
Message-ID: <C57B2D153CF2A3F8+acpHUeQY8TSISRTR@kernel.org>
References: <20260327-02-k3-i2c-v2-1-2119c0918868@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327-02-k3-i2c-v2-1-2119c0918868@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MMnP0fEUKo/hF0lVVy9iS97pzi7fdTkLkAf6dhL/5n7kRRKzpqzq2PuI
	qq0qtz4sGdd2TtO0Z/Ew4tEa6bjzDkGJ4OBu/dxtxzEmezjjPxURzzWuqcTi1lgOnFhIgwx
	7KobPcviFQUGRcrPTrB+jKE1dkgSpQYuY1BnnNaeyQ+ksjl4C9p/uiWrXl2ue2mu6yixaDt
	UCRXdDA2OFbNnlIu+9pdkrHUc2KGrHFzz9wUw6BjaOwCn9786KhpcIXCUZuv/5uE383m/YS
	ZER44tgHE+dCRC6ki+fIYC6w/MAMDKgfHwDHWPgz6CuNwIHE+RsNCcpM2qFbp1FIuc1zZAE
	EN7nrftOwDYnT8Y9RPjMEv47IRgUG1IHP38eugplDqsXJRc+KYJUmqbFsekMtgZIh4pXfez
	4OiTmJh0BG2EZq+ZZfKc//pDKxcehKOkrUghQZ1vEYjtEfbCpQMYAphI8v6thDIx90VG5A9
	GXH083NGDL26pewg2V+ujhPhjCMkSaCtz/1HTpdL3Tn4bYsgSvof5N3GhRxSdhyCAjvW3gC
	ya8bjdnFqjSq9CE4n9XK+axbEUrLcon+stlFGDXYqOY1pMobCVWHJ+HNgFL15/WeFGn3Qr3
	oEsGUUmcQ00urNj/xVMyXFiPtBVw7420BpJcctF11FCNKKZRIFWTOIGJ9UWCR2RtrGyEagT
	hACsrDEyTLlxqqiJSwDFVj1v3sT5mruLk1IJP0QjzKPdV6rZ6DohPOM6mgsxzDCzyYNKszO
	/qLMA3MImi7eUJBuj6UwpTotmiWYG3yxGp5TRqgK1AeHY9T4vyU9/A/uUq1c1DimzkO8WrB
	sprWhLaHhCHzRePrUoi9UyEmS590sLdKQ4/TVlq/8l9SjkWJ1XdwjKluIiKLd9v/kVnQKaw
	ggbANaVqHlFYHrqFWMBIvmfbtSXn8EGYUdk3hoN6pmLHWAkkzAEuvWcwTnZbD/6F8RONJii
	UxlfFNR4s3+3sS823DKPmnfxKKphU5c8qUezOjcxo9bBeLK6+Bp19LNCJ7d1ySDI0yIRmjx
	mDU3F/uNiM5WOyXvM2lByvNz0BFku/FUmi6YFXREIhsiC8VDCdh2NfQeA9X5U=
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0

Hi Yixun,

On Fri, Mar 27, 2026 at 19:40:40 CST, Yixun Lan wrote:
> Populate all I2C devicetree nodes for SpacemiT K3 SoC. The controller of
> i2c3 is reserved for secure domain, and not available from Linux. The
> controller of i2c7 simply doesn't exist from hardware perspective, as
> vendor directly name the i2c controller used for PMIC as i2c8.
> 
> Signed-off-by: Yixun Lan <dlan@kernel.org>
It looks like my Reviewed-by tag got dropped.
The changes look good to me anyway.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
