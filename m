Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 298D31DE2A5
	for <spacemit@lists.linux.dev>; Fri,  9 Jan 2026 01:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767922299; cv=none; b=cmMgMYUDr3dLEuIE6NeviBgAhXAEuWXXTY4eC3J+NFqS/kCaRfxGa4v448nrdw79VT+IaJ/9wPnQjk5FKhsPwqxzFerHrix6arbJN7KaNSycWLkyXx6CF7DJah/uI7O4SWroCK3BFv/2nQ7kkSjwErwzhelAoLxDCbAmac5/xZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767922299; c=relaxed/simple;
	bh=cF3e8hfldJWrkLrq63re0BxjmX8O8Uyne4H9gWO/Z7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+SsUgXUCavR2jZN/ne/4EBT4Q68mn1ZgKdiG1RshjOuUYtNbkF+rK5ovkM0ekoH6yW97CucfphApIAihYRv5xqWCfV3caeMF5tbuC92idUJ//BI/Kt0IDkj6OGJyXGGVjnpMv66AKDkof7XNyx3WZ8wAC2M7IwRKBwuWX/GCz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=YDs42Lu+; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="YDs42Lu+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767922291;
	bh=Lte9il4oOh/PBkig0SIYcOonMssQ6T0eES7c3nlrvpU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=YDs42Lu+zCb3DcLYNEmbA8Btm7oKeWpZPxf1MziHJR791I+QImd4bXzUsE35Wxg62
	 kD5Tuaya8Qyx/qIKZiehxCEYt1gKD4bVwovzYLz8xlmGnWBT5KEuKvBDE6cvazYGEr
	 mJxz97+MDVh7jUzoMO7DyCm0odw9H+H7psqZztMA=
X-QQ-mid: zesmtpgz9t1767922286t53ae930d
X-QQ-Originating-IP: +461X0RnN79QDiEa+Js9FDVz3gMxkKWrRbCGmI76R8Y=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Jan 2026 09:31:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10842519875104114801
EX-QQ-RecipientCnt: 15
Date: Fri, 9 Jan 2026 09:31:24 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: modify pinctrl node in dtsi
Message-ID: <0AA43966D8DE9163+aWBabCQG8v4XzD2h@kernel.org>
References: <20260108-kx-pinctrl-aib-io-pwr-domain-v2-0-6bcb46146e53@linux.spacemit.com>
 <20260108-kx-pinctrl-aib-io-pwr-domain-v2-3-6bcb46146e53@linux.spacemit.com>
 <20260108073722-GYA3634@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108073722-GYA3634@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NEbP9pf2ysjd3Q0Ysb+yD5ZoZepexWEDX0sm3Dj/dpNkkyVN+j4npUCL
	mNS/8avowzfh9wGAblUZmC3m8AfYZiXauKN86/jULVlnHSiWi4qbaGmU4Y14OPv9rS0CZu8
	6Ts3fLBLtF59NtqhDO8a6zt9NoYVrVVl1/O8ochX3Hf3DKVkXlP8sWB+C2tmq3WBHEXE+N3
	32C+ZcEejQrb3NKbYGqvv/f2rXW5xzQmAybOi1s6o/g4ERfOS5HGuYAhRkluMW26FrwZ4zy
	jiv8ei/Jnxdc3nL00TyRQsGSOJA8NNAT4ObeAOwxcKwHW/CYgNZKpJPj6gHcmlZTILfdMY2
	mErvkzbJ2aNDxkyf4RzALC/4JI8t1E4ZDCcOB6Q4K8j5mSnsUUc+KYlyqRUTmeZbvoLfJ6k
	8Cxmk08cWn2F3MPq/6AWzGquvZgcqRRsKNAH5P8ejLdyhSPLKR6WB/tijpmA7DezP66ygA8
	RzdW+RMSYG6IPsFXJFs/VreyMtfwIAQ1bghCztYukMzJpYzQxMi6AkkBqV23f+CGH7uoyEy
	1ds9io4HUT2r1IxKnmoKu5BQTdMnDpwJnJTlKwdcFTKJsCkGRyBaS6aWQKGdvh6RYzSPZfb
	6zJwTUEi5p4Tbybp1ywMVAdl0XDFotqstHO4XFv8+D3a6Fi3l/UF2Nium0H5f3WH3tjYLI8
	uj9u6GyeYBe9Po8Dqt6YkHngLhifg22/oVanEqQ2h0wpqD1lR8JnTFpgn3+vpEfKyVtn9Oi
	BtAfB0yUv9C8oCQCfYsdDM8g/PbIfagYK77b6FYiDAd0/Msf5StUcjKZJqWH63aaU4QooI5
	Pzdl1rXzEH+GIKA0kHGvh+umoyGF3Mb8ARiiSAFUe4/fWgwPyJ409YaJheER5rZhl2+9Ju9
	y9QO72Z8MV1+qgOFyaq5DkRiUmC3ep+Y+avwjgSLYGae36yYcwOt3qYcj5nl/Z9DJTfvvI8
	36z2ugFZSV+L1o2UKxOHbCFKaaJRrltM5AYehh0mqz9NSj5VqswlvueDEv9WD1YFBnb57Gt
	vXH78uZ75/elpzGoQY9W9N4GyElVGm5eHJ0uOXZ1kKio5FJ2rOX8EkyV5zaq5XsGUBg17hn
	orYtn48zLfYVZ0kLi3r6EY=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

On Thu, Jan 08, 2026 at 03:37:22PM +0800, Yixun Lan wrote:
> Hi Troy,
> 
>   if there is one more iteration, I'd suggest to adjust the patch titile, 
> to make it slightly more specific
> 
>   riscv: dts: spacemit: pinctrl: update register and IO power
Thanks for you pointing it out.
I'll use it if there is one more interation.

But I just want to confirm, if there are no further iterations,
you will be making the title change before applying it to your tree, right?

                              - Troy
