Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032B62BDC19
	for <spacemit@lists.linux.dev>; Fri, 17 Oct 2025 03:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760672303; cv=none; b=igueLB851QskhJoVSRN0uQf98gg/TD0j3gxF27QRV26g0Q4kNYFOesjpFgP5c0wKtes7UgoNwiUbeExXX5DbKnP9cHNjj5t29ixfzV62jfs3ncgg2RgNecpdhi69+3gmQBvYLgs/GVjls8e2CwFY/ojZm1J+2eV5AfbzrfF1KeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760672303; c=relaxed/simple;
	bh=6sKxFmD7xtbhw/U6fWw/5xDqmGg+lEMB/j657bkCRcw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TTLZ1KpKSHQuxU+VPZCTmWRKmeCKgonW2YOBrk4AxAGB1wrzT5YwihtWdyc5Mk44C2d8U+N/UuKdV4GqwWNLU4NFSz0x1/qJRdVq+LOzuKNmLQyIc/zqkUPcCQKu3UWgFDAjFcdE1G7qJaqpB63IyS9ZblrsojS5Y5UZobQJrwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=NrA2hetM; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="NrA2hetM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1760672216;
	bh=oBjWx1I4AnKMBoTG5upDqtcSRJpj6kwgVgcH9gHhiWk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=NrA2hetMPmqFFX5VpPiNznP6QG+gEN5FQ0Npwqqr/HbKLiz6wkybhayL4h1d/eiR5
	 m8O8yCQN9xVCfoKwSSZrfsf5fQpCXpKqC94gyHeplIGhf3QqXXfvcS5hRkhfolud+U
	 KVqnqKGvtPqwKVUzAt3UMoz4JDzcPUQZEOTsLuR0=
X-QQ-mid: esmtpgz14t1760672214t0abf1794
X-QQ-Originating-IP: TlDX3I/w/Ks7UHXpGBXnho4hAw+exomsa25mQwPtHzQ=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Oct 2025 11:36:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14831178928690405288
EX-QQ-RecipientCnt: 17
Date: Fri, 17 Oct 2025 11:36:51 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Jinmei Wei <weijinmei@linux.spacemit.com>
Subject: Re: [PATCH v5 0/2] ASoC: spacemit: add i2s support to K1 SoC
Message-ID: <A22605E3906E8F62+aPG50wdFlFzSMORA@kernel.org>
References: <20251017-k1-i2s-v5-0-401ae3775fcd@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251017-k1-i2s-v5-0-401ae3775fcd@linux.spacemit.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MWLCkAjnYYm52MwQO1Mzuin8y7IH2RZBNw5spbGSdMGtEzS0Cd1600uo
	8QcEuNobWxqstEWcSZbQRZXRtNL/CTd3QVormvDi5lVb1uZ7tT8jqGwbGMxtzYseXNz9kjS
	7nej1vnLa06nhAjIsFo/5QUGZJJFscnfRRvdZ7qMOx/VCU/xj9j7fxuQzKjzPaVAgJNolm8
	3y0GIqePyAaLVmeXmrb/3jCSgH1xkQ+yXoNjT1VvI1ZWjDX6VEGe5tvDo9tjuvGVUq46o2p
	Gsc8DTcd8P8wl4j86lD92zye3lUXTARibnfmKb6gtElr0uBfISLiXJi6/XnZRsLVjXXkypC
	fUN1WqvYF+O9w3bOp+mXHrEGp45jOxKqCVU0VIndKboqG3Q8tHZE4yfJOvZECbBEXi1Ds9L
	LoxEo1BNKRf506fWqFwwmm0zFx9iG/HePZrfUnJvD3d8xZcepHE37V/P9sFjVevcFQliQH9
	zTy7rCIMY3A0zAU4K/a2gnCeFSrO+JsG+k8h4e2tB9X26xV0YRtRQhO0W5KyPC5Z7cXMGSt
	vJu2hUiY9XwXS7cX9umuELLzw+OESvcYA8Kq6kb2lYzqOtjxkm95MaZJcYB9GA9z3bnQgHu
	dK5OJxs1AJlUebFcq8+u7id7GShtnnp249KWuTtb/2MSIhtRjtfQ1vC3igGtn69KnL2axNl
	dAYVxTvpR65+JkOrFKXmDX3TQSq+2JgQ89ImGLdXRCS0JCaNiIuTtthyaln042fcw6UjH1J
	ZjVvbzvagGiZt3STeSjQUu299wr0BihyDQAra4yCMDAtcZXLai7b7lP039gItWCZz/ZEVZb
	w2drd2EFg9qd4ScO9qEidkATlbeus9NAQvS9e/98rDMkhDODxC9jZWqGxHtPbsaX1z25BDl
	SbJP9a7KrbZWAlfzzO16D/mihPfr3go6fqbAcDtmoJ0I4UqizHwi7wOcMLrC+PAalQssbVl
	qQbRn77y7a6CbYk9uu+IQHz+WjY9y78kMWfV+sTdjNrxxe/xwjehF+pTrKs2yKe2WCvP8U4
	vg8E1C3cRV/woQH7QT3BEG687zh3DbDEFUrrx1eFwv27iDrSbAIRJUAmNT1NdJxjZrZIsRL
	jXh6VukxN+sUTMNWMpg394=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0

On Fri, Oct 17, 2025 at 11:16:16AM +0800, Troy Mitchell wrote:
> On the K1 SoC, there is a full-duplex I2S controller.
> 
> The I2S is programmable, with the sample width configurable
> to 8, 16, 18, or 32 bits.
> 
> A dedicated FIFO is provided for transmit (TXFIFO) and another
> for receive (RXFIFO). In non-packed mode, both FIFOs are 32
> entries deep and 32 bits wide, giving a total of 32 samples each.
> 
> The register definitions can be found here[1]
> 
> Link:
> https://developer.spacemit.com/documentation?token=Rn9Kw3iFHirAMgkIpTAcV2Arnkf#18.2-spi%2Fi2s [1]
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
> Changes in v5:
> - Patch 1/2:
>   - nothing
> - Patch 2/2:
>   - dont't read sspsp value in spacemit_i2s_init()
>   - set SSPSP_FSRT bit for DSP_A mode (was missing in previous version)
The changelog here is wrong..
Correct version:
    - do not set SSPSP_FSRT for DSP_B

Best regards,
Troy
> - Link to v4: https://lore.kernel.org/all/20250921-k1-i2s-v4-0-4f819f50e468@linux.spacemit.com/
> 
