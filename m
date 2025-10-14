Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683BF28F50F
	for <spacemit@lists.linux.dev>; Tue, 14 Oct 2025 01:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760404588; cv=none; b=DFjyTmVSGzZYCK/3QybTTadd1jqOKKzIY5PGlx+zSLXaAv5ILT8R6BMB/2ZOJgvt5FrLDJZWcLXU5uR974qfHEKoeDS2ll4N94bOi4eoTm/RBVKakMzvmL51kAyNMFXZng0Ir1kGXOJCgjJaa+oi4hKdpHPxJO+FZevXompIuQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760404588; c=relaxed/simple;
	bh=ly90muq8Cu7cNAfo5LyDFAKK8zB6SZmBgl/e3Gqtgzs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGmDoeRZiWxGhUYXj3u2blY7pD8w1DFoU+Mv4Wh87yREddFho0G+KVdqby0Sau/q1/Dc+Tb+uXpiNFknmAWcoQG6ebw/oOWlgz8k3hdyqOz2okoih2SrnHwQvVDcs+yxD/tVeGgW74rSoG3MJA6j7LIyP+bszCasDtLJMNT7jX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=gIQahV4n; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="gIQahV4n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760404508;
	bh=yPaqLTFJBou/8d1hMyxh74PBxgkDsYMEzO+87OROHB0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=gIQahV4nYcfZPXN831GaW2evLz/LB7hnbHbG35YusVe/IIjQKN+6jldM+xEJ9HjNU
	 WrJ3WUxFP99enmzNu6uVKrHoI2o5m/dn6mw5Z3Jy0M+azu1kmtIjNbhBU85+cJojJo
	 mqAkyobyz/G5tJLewoGfZtyvMVzl+1SkNl5UtoGI=
X-QQ-mid: esmtpgz13t1760404499t2e911499
X-QQ-Originating-IP: o0PzaMQ5hTsLiEQfnYn0/i0z9Av6u2RRMSRj69aXyEU=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Oct 2025 09:14:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1259685802699772283
EX-QQ-RecipientCnt: 16
Date: Tue, 14 Oct 2025 09:14:57 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Mark Brown <broonie@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v4 2/2] ASoC: spacemit: add i2s support for K1 SoC
Message-ID: <775044E19528DA5A+aO2kEerOWeY8ad0h@kernel.org>
References: <20250921-k1-i2s-v4-0-4f819f50e468@linux.spacemit.com>
 <20250921-k1-i2s-v4-2-4f819f50e468@linux.spacemit.com>
 <d1d965c4-f0f4-4b09-b5c3-5925d5f7ce1b@sirena.org.uk>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d1d965c4-f0f4-4b09-b5c3-5925d5f7ce1b@sirena.org.uk>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3a-0
X-QQ-XMAILINFO: OFWsfmE1GYcucjtZg+KEjRlCsj0y/80SVScxcqo55Hl6k5plK2uYiE0e
	UmmSczndIIISYCroAAZfA1qLkfBtwrgwxq9OJv5L7tXsZRdPi6XKVQcVD9EghKXXfUTVYkO
	WybVF9Hv1dX+kGiJex2PyHnyew6kKxHh5IKGUuse8CvbwOkjJWe8H3Eazezl9tZvTn6urp+
	0V3TiCPDh6iX76ZcI2mtgY1+f1VHdJ2hPsurji0OUB2/XeHVIlx+pF9huFPmSwO2ybR3KnV
	8nhf03Qa6SZvf/GLZYRo96hXRfvYBFWB6u0hIYNJlX9Gcw2qNmgNY491iEjHJV5MeKJ/qsl
	v/UwM6AXjHHEU0PFWLYaQPpFA/luOoUoZ7ij4cmQCFfSdpKNMqkwIPqJOvnAogPK68tUOTd
	thtmZlqpurHYUrfP6VqOhYdKR7TH3akptlludkELnKi56Xljl59ixwnw3Vbso3iux5l0z/A
	G7Tsa/O/GjQtPwa0d4lAK+SDEhrWEKsNWzyjtT3wx5whuL+UGejBfwEN/0tImC1RDovHBJk
	kLydjegjIXVU42sH+gf7VNiLaQg82KAr50JdokvTE4c4Jm1uG5kKqJAbQYybjzkSq8E75aH
	ToZAuaGP9onKFZ89UVkmCQu3UXi+ojDa0Aq1py7Xcm7urC3RapGsNnkL/ko4kxfs+8MoVhG
	Ec19cuPeHskjfMwrd/s68TyBZe8+RupJe+nqM11bX36qVKtzxThgEkZtRitlAS5pxdEQK2D
	DqZkVdvFjWxBgYGc2UJRCnMchydHHPo32/62kOq+knDZF9bWofFZ5kGYwPYYXSy09S96+jj
	sWnszEejE8l7TI9Z+G+HRQf3MKOKnVCxvE7PKjqAK52/FzRIQAPxms7aevGWT7LzxJCcoSC
	/StrcXgL3elcPh3dlbysTxCYkPSCNer7zxQT+k/TgYjXIddabgHs7N4vnUJcIgz5zEAG2qP
	s8dWyRbAJvvaVhXEVPaO3UzoW54sIqyx3uSD2aLnBIYSmMKnNpIDYEfiy7Iu+8oRkv0926w
	gsBrX5ctnGNRPAlpQz4KIYYKgANhBPxNiwqAohFdVqjGKfmJMuEcjRiFmfrclspdKC0vbTs
	w==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-QQ-RECHKSPAM: 0

On Mon, Oct 13, 2025 at 01:05:58PM +0100, Mark Brown wrote:
> On Sun, Sep 21, 2025 at 04:52:17PM +0800, Troy Mitchell wrote:
> 
> > +	case SND_SOC_DAIFMT_DSP_A:
> > +	case SND_SOC_DAIFMT_DSP_B:
> > +		snd_pcm_hw_constraint_minmax(substream->runtime,
> > +					     SNDRV_PCM_HW_PARAM_CHANNELS,
> > +					     1, 1);
> > +		snd_pcm_hw_constraint_mask64(substream->runtime,
> > +					     SNDRV_PCM_HW_PARAM_FORMAT,
> > +					     SNDRV_PCM_FMTBIT_S32_LE);
> > +		break;
> 
> The handling for one of these is buggy, DSP A and B are distinct modes
> but throughout the driver they're handled identically AFAICT.
Thanks! Indeed, this bug was introduced in this version.
I’ll fix it and send v5 ASAP.

                            - Troy


