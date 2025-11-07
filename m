Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 732C520322
	for <spacemit@lists.linux.dev>; Fri,  7 Nov 2025 01:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762479108; cv=none; b=T1aQmRjQHZu+Kgxt/RGkqTZHJ/+3As4YZQATnIBwfrV08+/q6rx2SPR71XwB+YcQTOh7RuLe+bT4oLaP17qqeYYx8o4X3khK/M2DB/4fdyDXS9QuClUuJwlnHZzmfJRkJBO2xEBhHfOImmfHct4U51zIUExzCxwYISUN3cxXY/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762479108; c=relaxed/simple;
	bh=aogQJJfyjDXHY3kQzCAsj7IX0vVUjUq6HzwCBdUdhaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pLGF01BSV6wztb/Wj6XqL17yQZRTy3HYLvODHJVA7/75neL6tjUmtAlJiuu9B5i31bQy7fBF3aYr5Oc+j/PFbLuEdnZLz/tn11Cjaj2GeW8DqrmrAzZR+7JcAjHDb1pyMb6NVAOaHVfbFlA7ejcarGmd365Z6lkJVTbChXhzS4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=PzJNXuF2; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="PzJNXuF2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1762479006;
	bh=35L+rrx9K1LdyqVcy5E43gyFYLFh2mo/NaELv+Hva9Y=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=PzJNXuF2/g9WamuiFe2RPX2vTiFaipLMPXbNpof/2M6ddxauFk3RV3WD9l3jbJJ8R
	 LBIq9NQ5qm+A5u7mJIU/SMjB1m6ObToPTdZd0l9fFWLQH4Sg0I7339TWii5Dyn+9jq
	 rUnoWAPPOqTG1LfjEtM8D50l3WHIvcjIE+sYFuQM=
X-QQ-mid: esmtpsz18t1762478998t36cfe8cb
X-QQ-Originating-IP: XYy2puoEOwMWms+dhGae90A2kQraig8IBA6V6nniF3E=
Received: from = ( [183.48.246.190])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Nov 2025 09:29:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 13916769930896062852
EX-QQ-RecipientCnt: 14
Date: Fri, 7 Nov 2025 09:29:56 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Lee Jones <lee@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>, Andi Shyti <andi.shyti@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-i2c@vger.kernel.org,
	linux-rtc@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: (subset) [PATCH v2 1/4] mfd: simple-mfd-i2c: remove select I2C_K1
Message-ID: <71DB25E553BE0B04+aQ1LlKzeR-FkZA83@kernel.org>
References: <20251027-p1-kconfig-fix-v2-1-49688f30bae8@linux.spacemit.com>
 <176244506110.1925720.10807118665958896958.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176244506110.1925720.10807118665958896958.b4-ty@kernel.org>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mf2c2cXG8XEi7srU0LhC/T1EZfWbKzg7cytxOLQp1ZqFcZ8HEx+JxizT
	fqet0Wetv9T9LVlbSNxFnKSMnph+o2GQCszqIr3LJlartAHVmXzRd4DIkRNX2lQyVqrr4aH
	V52Q/z3w3CypHNywH4yQ31KZYR/3rZt+HKB7Wr0N8Hp9KBfLHrBP49d61WaA4Bdc8BVfxJT
	+uX4HDYE2AKMFeNTsTYWhZ1YijWFr0e0Lp4BSr2tMgIQaRAzsWuHrJyKOGsS8qfWLtRQueG
	EkZbVjOqP2TSf6MT1NJ2VDhjX++0sIANHSn7Smp1bmWmXl5YI2OymQov7AnyJDspa0Lj/tc
	1mkiFaVlxGGwM7KYy0DX3Ssc3YkGO+E6oH5utC/N9gIVfOh17+TwhDxy9gV/iDqfbIAEHJO
	+AyGeOCpZyWRl9FgApm4UN90SV9CVwFjA1+Ahf25892cOOqQGTdpF3imMMWGmlhpPMla2c/
	smu0Q1Tdg2VhiOhV86elLrawhU/RCwv/DC0PRZ2j2bf6GOuzsOaUxjf+ggK2AKJ7VFvJm16
	CeSBkCdm4WMfRD3FMV3cWhBG3G8rOaVfjQcX5xjSSATkypBjOoXWWlzeZhZsITUnZcujcMN
	LaWqC4wDZz6pv5N4+88fghlFadPa+X+hulSQvGKyuDDm+eX6PPuO1WVd5y7IeSAnwC5muHN
	CIEWg5UxpN+wCjzVhGKcrAXlzcPubth0baM+757m2cfnjiDI5VgH8UTIoUK67wMfWJ7astb
	95wdOgGBgXUu7CHzJfpjV4BQExP6OWJef4fnXTazama2qv8S5iDKAVpLH/Oz4Py2ws/Yx+w
	WxhjxHLnwLh718aJmUbTY9DANs74eYRk4NTYxf+GwRjxCQr8BFbyPvnijqVDsGGJeQchXeX
	+46UmU4SGmKxn90dhAMBqIPdegSTA0TqqZH7lH9Mw00JUqRbFQgjPQaP84lYRWmhfJdhf60
	8CTbrRkPYvVQomf2x1MBDVcNTPdqyKcrjttfGlQFYWWzBXswJXQ+pNGpjBMwplE4wCEH92b
	Nx2aBi/OvcQODfNR+tRguYfDA5MS6hzpY7M8nA+7mtLj/08uQUNgvAdCL4NTSUtmEI7S0sQ
	9n4qBwreKwO
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

On Thu, Nov 06, 2025 at 04:04:21PM +0000, Lee Jones wrote:
> On Mon, 27 Oct 2025 13:48:05 +0800, Troy Mitchell wrote:
> > select will force a symbol to a specific value without considering
> > its dependencies. As a result, the i2c-k1 driver will fail to build
> > when OF or COMMON_CLK are disabled.
> > 
> > The reason for removing I2C_K1 instead of adding a depends on condition
> > is to keep the possibility for other SoCs to use this PMIC.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [1/4] mfd: simple-mfd-i2c: remove select I2C_K1
>       commit: ecf6bc474ae97c404e2125b413eb0ef3627b03c5
Hi Lee,

I think you didn't notice this reply [1]
(Maybe because he was replying to the cover letter).

As Aurelien mentioned, the current shutdown/reboot (and possibly the regulator
as well) intends to use the `default MFD_SPACEMIT_P1`.
So if there’s no `default m if ARCH_SPACEMIT`,
the default value in subdevices may not make much sense.

But don’t worry — to make things easier for you, I’ll send an additional
patch based on your branch (in this series).

How does that sound?

Link: https://lore.kernel.org/all/aP9IVckJT-k2_O4K@aurel32.net/ [1]
> 
> --
> Lee Jones [李琼斯]
> 
> 
