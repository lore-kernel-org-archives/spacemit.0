Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72112258CD7
	for <spacemit@lists.linux.dev>; Wed, 24 Dec 2025 02:57:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766545062; cv=none; b=OYrS5DVHxB/mzdsO9C49FeJGZ9g/oDYmW5iFB1FSm6CI/GvtXjJMlZhze6ty7U8HpKahJUGfGnE82KDrsuXybgXSmBydbBXlon+3Eo5C/66b4EtBxHVunmBgSaHbvx+/jYqJWvsioLlAIt05O2youEUcZigpIstpliBcLjk3tGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766545062; c=relaxed/simple;
	bh=7lROny5Tge0kHhh8J5Rq9wnPXe82+bezEHVpY85EBso=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWShMGlMS7DBO74imkbt8gtiZXgZtfDY5ZCOlYFvPBqWXcLSuiorCLPxWqruBHMcyOaIMC/G/kQdmCEH3R7zOvLZU8ZS1iuox+U9SmEyAimxV86wtjF91ysIWP0qJOhLfR95oO5wRexs75RPTsOxVhO7QGM5PRddRV/lvU6XVZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=OQoHIOsp; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="OQoHIOsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1766544994;
	bh=kqmD9KzPofpBkzhYXj3pS9Rz14dgYcaXw+mdYqkGSmU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=OQoHIOspfBKFLmhjKkTuv/gh0sTFRGK5Q2nEbbos0BPNKxk2DBJfDO69ZWI1Ec9Vd
	 jmAra/QY/HDExEoYbxa3PEvG2k/4zLv7mHyDtxKbVWirChOsCnlxXTD59Xi7zPDgfN
	 FyFwyGpoES7QGFpbKzRohuLi3yrm1AYkqm8hoIM4=
X-QQ-mid: zesmtpgz3t1766544992t73a38fc5
X-QQ-Originating-IP: rtoro2YV/3fXqeddsOLVmiGvuBnIxcaaNAkjFCG+GJw=
Received: from = ( [120.239.196.19])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 24 Dec 2025 10:56:31 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15150131563580533562
EX-QQ-RecipientCnt: 11
Date: Wed, 24 Dec 2025 10:56:31 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: pinctrl: spacemit: add K3 SoC
 support
Message-ID: <8840B91CE3D9278B+aUtWX6fizXnheGMl@kernel.org>
References: <20251220-02-k3-pinctrl-v1-0-f6f4aea60abf@gentoo.org>
 <20251220-02-k3-pinctrl-v1-1-f6f4aea60abf@gentoo.org>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251220-02-k3-pinctrl-v1-1-f6f4aea60abf@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MfJtHqZtrd+ORU4zn6lBUs2gKRknHpX78VxNZ/1kWuCzh6l+l2WAA+/T
	fad2+uhblq41A5eaTtRDLaAQRcfOeqIp7zcaPTSL/gac3P2n4O1zhCgXSd713Gcz7WKiOLa
	kXmXqiEq1x5zNYEIrzfsbQyaU2HfdqSVJFhUYfvFkarkXMqdS51Qnr8t4VfeQDpVocu62Qe
	9/rEg5f4iL49FGvxbIYtNlc4/O+CDuQTS/iXXmr66J/vl42+doHIY5PBQp0HrOWs98k+CM1
	qfpl21DKr/oZBjB9JTBv9N3YPy+xMq1WE6TDdtHUo4mkyEsGZfjQvK+vYM82WtNHa0vBlmX
	c4dQBiFsohqzLj/QMDlfHET4h4SNqTcM2y8LqV4VJFpb+17yPwLaXnrHhDDLrH8cgen/vI/
	vofbcufut19cQq2ueMhKBqZwlV45aEzpSq+vnhqLvK8MhMapeSHjxVlWQ74aCEleAWOwdES
	TEKZ1XRNCapQhImZJdum3+vp+iPA3xDDjIUFLAJ5CxZ/SbF2SOpB1X8zFTv5CBD46/D4r68
	NmS1W4mkta5uneU7vg1Af/K8Md5xM2LrtVa50ftxY4Kr0u67DZeDoHsn84exRUq77mkThAY
	WxZaWMDhd8SBJDPk953AltRx4VTdKfTljgzm8fwnBhJiDAM3d3d5tRVzx61Z/GA8GtF223A
	2aDRiiYaHXyUyTdEcnc1SuTkN584TX8mwgnmzrE/Hnd+GHXYokmJIuTyqX7T1HhwqamHCUa
	S2jE11ovs2HzRSnVkZPsgJCMpWEKhFvQ7driar/i0UgXlWedHrsaIMrOfbXaPl/J31YRBbq
	jO5jbrgsJ0huj2Ohqj1wZt7SQ+cmWuhn7uUA2+Xo5sUOfNs1hHXpHYnol2gQl90+62cZQT/
	ShyoyccjSE7KkjJKl1e03gdQWe9Lu8F922y6auqoCOhKcB71PWeccvBbGnSPDnIzgwy9u6t
	k3iQJNFIr84cjPh0mko7FusweS2RjrjMyrXgjL418mM9Mjbg/iXDu31V+y9vZzZbmbqeXW1
	FxjF9E5GnwKQoz1Zuq6npCZx8XiY/Y5iuU65G0kw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Hi Yixun,

On Sat, Dec 20, 2025 at 06:14:53PM +0800, Yixun Lan wrote:
> Add new compatible string for SpacemiT K3 SoC, the pinctrl IP shares
> almost same logic with previous K1 generation, but has different register
> offset and pin configuration, for example the drive strength and
> schmitter trigger settings has been changed.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> index d80e88aa07b4..c5b0218ad625 100644
> --- a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> @@ -11,7 +11,9 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: spacemit,k1-pinctrl
> +    enum:
> +      - spacemit,k1-pinctrl
> +      - spacemit,k3-pinctrl
The drive-strength description should be updated. The driver uses a
different current table between K1 and K3, but the binding description does not
mention K3.

                              - Troy
>  
>    reg:
>      items:
> 
> -- 
> 2.52.0
> 
> 
