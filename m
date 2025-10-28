Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B732137932
	for <spacemit@lists.linux.dev>; Tue, 28 Oct 2025 01:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761615689; cv=none; b=bAU55ALBLIfNTXMNdgrSI/+3FsUNXooqdGNNTzTsVCsv/l6TN9PrIKfDYBf5N4RdYDjARBMd6cvJOR075vYNQjaOzAwIFIy64H8InKr+/RlZPESq1FKJxfsa0ulo1v3lKkynx78+TxRa4p4rBVEqooOGaY0qDi5n4FjkQrc7Ft8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761615689; c=relaxed/simple;
	bh=EcrCH7gbIe4tGzJmOJrNzXrhbMMcFGwWbnUNw4n4WrA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jioxak1t5zIswMcoOp4K9Z4A6uXor6sMqWo5P9Xf/zUMVuVSfkLeq+82M6a2+0AD/JDLh1eLDEaHOJr6S3ZzeKglc5+hEZyz+Z8LFaMlVMw5GC/QpytMx1EPwrj24OBSapdVFCuRi/yix6kTVCtlMtcamcIslAd2YJWNCjHnwyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=kGlVSUEO; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="kGlVSUEO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761615638;
	bh=+mEBbpFiHX0B6MrOl3zAV3KNKguB1G+AXghB9W8we/8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=kGlVSUEOrGkDFXHO5ca/aZBuFV2DoicFq7oU2X3RM3HVJmtaqI0SOj8DsibtNBrEZ
	 /0loprYQvfoqKUZFAtsYVsCto5r5hqoEcWVOjVsVvmbkyCoQ58fwWlm/Z2njdFchfW
	 iOCBNSosCSu+Y0cGcD0I9HzQMcKhoVcf61PQCjMs=
X-QQ-mid: zesmtpgz5t1761615636t467ae7ec
X-QQ-Originating-IP: SsILZdTTgN0uFTzov6mmR6/vmW89qEWwT3QwJkaNYT8=
Received: from = ( [183.48.246.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 28 Oct 2025 09:40:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2958071386083091418
EX-QQ-RecipientCnt: 13
Date: Tue, 28 Oct 2025 09:40:34 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>, broonie@kernel.org, dlan@gentoo.org
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: spi: add SpacemiT K1 SPI support
Message-ID: <3B5AA5AFF5C53D64+aQAfEn1OBGmevjfS@kernel.org>
References: <20251027125504.297033-1-elder@riscstar.com>
 <20251027125504.297033-2-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251027125504.297033-2-elder@riscstar.com>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OSUW9vQLVhiZfSwad4tKpijbLwrG30Nc4mGcj11SCsM4vcbhjeTSl6kb
	/89I5oFsVGC3gdawGeVu3D0lMOUEpK4kogHl3m4ULQlZLi85ICM3ZCqThBOWgDt6acitykJ
	hGoBcNdB44Oi4tBST+BU3aPGmXZ7Hmd9ShMzTpx0nioFjvNoqqn2vWfvEI4TmiztHp+qF3i
	F+mQtCNmI706RtJbGYx1/PFN6hZ+3qBBV6QiSf53JHZMXwWCETlApbl0kwIq9f9uGlcBB4h
	qS/2XdAa92tv2yStZ5xkzJYyfTfll/EdU4rgonwupf2DVBoJjfteB9DF5RlpwWS+6dEQA+h
	xvh8FIHu0+TOkeKJhkA5VbxvRELF0mok3wEWU0Mi4h+dVkxYSw+pvDuYYtBaImTD3A6c1am
	W7A67T03CaiJGFu8Tm220uLS93kZpK0E1y3wAeKMOldvMwYAkIEUMDIqkCUrV7AkHsC3Yf8
	lyrZorBS3ZiHKb6XELTKJWo+7dlzW75ivXqzYsdWxkgX+JLuv1hTalA3uE/Zpj1FmTV17+p
	Tg44rhAAqWJ3PtK27EQFlDz2mL/s2oy6WN8PJCjEk1zb5o9r0CjXnhnz8/zUjAdypcovJwH
	WKoK7h+BGxFGs8IBVAY8L4+fsvibvqzRv8Zq6K1yGcX64eK7gVWV1d/c1Rix8713IBIrHsM
	RS9x7TxkyeDm7F4Kl46KYCg7WT/dDgTiGsO086DJddw/Sfm2npfQMmVJcb7SyS3zO3BLHZp
	UcWoNixF7NDAfAGbM2J68wfZXbjbjAouiOzWSpdsbZThjMMiNbEyWvWBmuYqXKQFX2hHUr0
	hndcwZenD0Y1ID+UUn8YZVMWRTE67hq3Ry7BlsS4ZV8zJeog3jni55ZWPxEb7KQnjTf0A6Y
	iY/KPrmtty2BzLcGYlLswmDH4p8n7es66fJIigDtI0TdchM+W7fgfSHTu7PPTR7TASC7HqI
	2bZ1MmUefpdltgHCpYhxMkQpecCrgZlovfDsPfiFZa00uwMEOqom9dsoSg6nyDYgIfc+eua
	nobrIqjkq3W6v5rm1wS3Dov48iWCIyoz5R0fVa2g==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0

On Mon, Oct 27, 2025 at 07:55:01AM -0500, Alex Elder wrote:
> Add support for the SPI controller implemented by the SpacemiT K1 SoC.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> ---
Acked-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
