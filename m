Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EDF22641D8
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 06:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852353; cv=none; b=ECglZ74V63tqYD27rvDgf1ccg0SSzbl2uSRO0V+f2jfSKYxKAJ4XNNZRMWn2yUTQ1DU+k4HulJJ6Ndy5sHasjMVgiNXeLuTD58/9hhhFyBuTCy76R90QL++O9cuDliJm4LZknwgJ60CI5RewRFIUemecCzx07EY2WWVlUX9Zy7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852353; c=relaxed/simple;
	bh=F9bgMHjWCtw9COwvVnYwRZ2ASNpIkArfUg6YDe4p0DY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kJ0bMNivAv6z98Pp9c6rLrADzeM+22fJ/1nTC/yN+ztlkJTzwD+3fZU4x+nBoBenh3YtWe+nqw1ex/6ptMVwrD8hBDjlrUJ+iM8Buy9cyzNQmEmXqo4hmpMeONIKpz8XdDJOMF5Icl+NKSfIbcZlidvZV+ucPePh2GZi5MpJ0bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Iqvu07/O; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Iqvu07/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767852296;
	bh=Kb5K0iHmhVo6j8LIgQJwjRVhLZwxwVD0tXIimEEYGb0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=Iqvu07/OMbvyV0bzDliIc/xPa9f/6yVQtZw+ol7kseaqR17G34lZEUsHEbK5eZDzj
	 leFVxvggLW/zCLHPqSHhqBcuFF4UCywJ9NdUjA/IiQc6d9Aa2blYXW4D0JbKJQwh9F
	 TOacrv4rT/Z7H/sFKXV0cFF412kfTfhOh8rehnoQ=
X-QQ-mid: esmtpgz11t1767852294t43f90bb5
X-QQ-Originating-IP: HffZ7RlcyMDrYxCv2ae82zj8z6cmAht2vrfhsveVQHU=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:04:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3767647049890093468
EX-QQ-RecipientCnt: 16
Date: Thu, 8 Jan 2026 14:04:52 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: add syscon property
Message-ID: <16661E5F43A23979+aV9JBP2EbX0iBE9T@kernel.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
 <20251227-lavender-turkey-from-camelot-ab6aec@quoll>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-lavender-turkey-from-camelot-ab6aec@quoll>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MHmS+iNcn8JXoEY7+Ai5LGVVDFRVb0VaCxkV25WDazznTQmYn5fkvl+E
	cPqJcKLq+AkNHfuNJ/kmnbKpHd8ipHSsQXZ8cheexYrwjX/LOXgrPdbZwxkrnMhHufa6XlJ
	AsxsjOsWyRs+zNGwpEds1zxzmGRpi8DGArLd0R7HGGpfEzkTl05MhquN/bF/Dl9uZbFl7VN
	hfSTmCkKsS4m6owZPmPQfCJEueh1ALUqXK07CvTmtDKRIKYHbq8IG2cnWh0XNdMy2Aohv14
	1IwyJp0MuySWikmwNrfnDAdR3aIoRnImoUvxqvB1hQg6FvN0Q0e42iNpttggiTUFnE3s9zr
	6I5+5iwNgiELfbASmyEMQIgJUIHxlfxWiNASlyTGTPmemowSQevDiRvveyt1JcIVchcVKI2
	LuoVEmyVBibLhzC/T4rIdRJ/eo4w5MabRZc0hgiBxp+Y9ZRHX13eRnb4/NCqQmW6iK7P04N
	2i2Y9RDnV62VPHYZ4qIs3JskzAvt+91PmifOKBlXjEXjh+uW+B2ctSOBz0TmoaZAQ+3dCpS
	XnvZddmgpHLoOf6CiHIVltrQAbp5Ts2MXMgLs6eG3gU+vJ2/1MyBlzpxH5W5jay6Iqv+zSp
	8QnSFAuh04qpB7f8wEXUGHf0pI9Q+hQyrhpLhOe6ZA11U7H3thi75ycJ4IMmVjVJlDqdTAg
	t+pmZkcaVEIRXW5nHLvCADvhEw2+iDYCpOlcnzc5Bg0v4U4mOcdMyVvvcrbfekS8MXSZ15u
	xgrBo/95GT4rkwDcf5qMxQwq0vE28ehz19irc1GUipzmi4ZyoXaw8BGX/+l/FBsSoOe+8H0
	3PYTgXZQczmYeajs+nR80sr1ertJaFz7B4HXaEzauYshitgRKwKXcMrH27OHuzW32NCjtt2
	6UFVC57j9KXaAX2YT0dOZq0W7yZOzF7wO1NxDfIHPJUav3+A/Y0Qwfjl5hnRozcCU+LGSt7
	l67AUw1xtk7duPnjn+BvO2nJ2ii4Q4N9VLD36QmtVrxgcZDETjVRXbgH5z2m+byDRfzu1i/
	O6G+o6PzOAcxg4qskWiDpNtY1V+OIMX6zYXcVIftap+AxgZsNXY+93XdiF+4DuoY4qhBWtZ
	6tMwluFAmX2nDmFrl4yDSeYqE/QWDKeuA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

On Sat, Dec 27, 2025 at 01:58:52PM +0100, Krzysztof Kozlowski wrote:
> On Tue, Dec 23, 2025 at 05:11:11PM +0800, Troy Mitchell wrote:
> > In order to access the protected IO power domain registers, a valid
> > unlock sequence must be performed by writing the required keys to the
> > AIB Secure Access Register (ASAR).
> > 
> > The ASAR register resides within the APBC register address space.
> > A corresponding syscon property is added to allow the pinctrl driver
> > to access this register.
> >
> 
> Also:
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> You are not adding syscon to all pinctrls.
I lost "spacemit" prefix. I'll add it in the next version.
Thanks!

                        - Troy
> 
> Best regards,
> Krzysztof
> 
> 
