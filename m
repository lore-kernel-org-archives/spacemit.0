Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792717894;
	b=4IX/X0akbwO1wDl5jPL4UI8vbzeP6dOnmkUY1x0g/Af/Mrh+FQi/BDKdEBx9lpikiQA6
	 /dsXyxCRUQTk6eVe55h3v88Q6/R+FejFOfeWl37oQpGnoPBwcad40oJKkgnNegagJbRve
	 20nV7leL3ETWfmY5fuuKiOlZJ1vr49arBxw7IRVh9Rf+wjCvR+H0DeWd+lhFx6VtU45vT
	 cFeSWe7uRISejpnuMaxG+8Br03Ov6vs+/HUL/8uKpkcMJGLqRvAG8+QBWd2cLQ0Ong4Au
	 V9wSqLLk4plVhEF9zmJBZa3I8VmstaLuSeHLZKxDU1pK7LdsUoFRHf5GuC6tTJHPxfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792717894;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ca0MKmziHGn/ENW6MtF0WQWdMBBji0twFfNmZik5cvc=;
	b=5AzGzL9mO/KGuw+a8KV6yaKQnn4nUjc9J6mjuiTjR6KFNXhlc2/qU9FQbNFtl7zSMCti
	 SOtvPYa08X1g5Khx7dF8/7IKgaQWgWs3kUywl2m6ER3o/M8tjzMSzywpinI2cVUTcQo/3
	 2NVEeVSpTt3/JQp5Hlrd/YH0q+TmmqBadHmiw2LPDWP+TLHj6qU1tvrW6B0kFJ7wGppIT
	 TRQCOavri0DM8Pb65L/pu2iXcTlDw14nNNCLhgzd22RNzE6KkbUqqk3WC4v4qP6zFB4rd
	 CwZUsCz9bKe6PJb+ZoyT2GQFCHWPrM1eTZVe3gx392EB9cwKukb9LSy5LaVbk1W4T3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FrZfPOTn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4759D606A324
	for <spacemit@lists.linux.dev>; Fri, 23 Oct 2026 01:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FrZfPOTn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E5EF1F01828;
	Fri, 23 Oct 2026 01:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792717893;
	bh=ca0MKmziHGn/ENW6MtF0WQWdMBBji0twFfNmZik5cvc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FrZfPOTnVfZhsxv1GNB7Pt778yefpphIIR8UKOhtzih8FJJE1c7nFA8xJax0nL2mV
	 1eSLgJSbWwe90kn9rZw9K28ri9aIecJXeXDbC35es3VUHxv1n3oHR/9jEzQLU8Q9pV
	 m+0U/AfSKFI74782fBWXBk5k9JhBZbxrkyZZNiP7RqCC4usMuRXOCLMsV/geevyg1a
	 olCbWUxMF7xSkMRTQZ+xk/qTr38V9RxRU/Q/KvzGsSzYecy3Q8WPFwg1NAXCyGGNXk
	 aMcI00PnjXu7+hzphd/BT/TO3lzz6vfx7zhjt4rtRchggwSMJnsUwn9kGdxpVvhBS6
	 xPfmoB+Q4IApw==
From: Yixun Lan <dlan@kernel.org>
To: u-boot@lists.u-boot-project.org,
	Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Yixun Lan <dlan@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Simon Glass <sjg@chromium.org>,
	Daniel Golle <daniel@makrotopia.org>,
	Randolph Sapp <rs@ti.com>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Kory Maincent <kory.maincent@bootlin.com>,
	E Shattow <e@freeshell.de>,
	Yao Zi <me@ziyao.cc>,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v4 0/2] tools: mkimage: add SpacemiT K3 boot image support
Date: Fri, 23 Oct 2026 01:11:27 +0000
Message-ID: <179267091870.88099.14500651911580762927.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010-spacemit-aihd-v4-0-e7152ae4d71a@pigmoral.tech>
References: <20261010-spacemit-aihd-v4-0-e7152ae4d71a@pigmoral.tech>
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Post: <mailto:spacemit@lists.linux.dev>
List-Help: <mailto:spacemit+help@lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
List-Owner: <mailto:spacemit+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 10 Oct 2026 00:31:06 +0800, Junhui Liu wrote:
> The SpacemiT BootROM loads a first-stage bootloader from storage or over
> USB in MaskROM mode. Vendor firmware packages this bootloader as FSBL.bin.
> 
> This series documents the SpacemiT boot image format and adds the
> "smtimage" mkimage type for the CRC32-protected K3 variant used in
> non-secure boot mode. It provides the FSBL packaging needed for future
> K3 SPL support. Select K3 with "-n k3" when creating an image.
> 
> [...]

Applied, thanks!

[1/2] tools: mkimage: add SpacemiT K3 boot image support
      https://git.u-boot-project.org/u-boot/custodians/u-boot-spacemit/-/commit/1d43f1c5f35614ef542532d563166c2ef8cdcbaf
[2/2] doc: board: spacemit: document the SpacemiT boot image format
      https://git.u-boot-project.org/u-boot/custodians/u-boot-spacemit/-/commit/b0acc14b606ced3c76c43594a474cd80fc791f4a

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
