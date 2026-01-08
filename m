Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51EF72D73BC
	for <spacemit@lists.linux.dev>; Thu,  8 Jan 2026 05:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767849916; cv=none; b=r/e2DvvQIlArLHormM3mfr3rr81YU3xQ7oOpLSxiawupRa0R1JRmrhFBrzH/q0XoN4HEIb4b7lf9Kls0pU/YltVMWluZ55DswLd2rxMIARBMjZ9abgjg2m1w/d/jtv6T+5Y53aDSIsR6XuOSSNF7kBDYW1xfHc+cdMspfJs9Hh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767849916; c=relaxed/simple;
	bh=cUDJ/Jq0808hTirUXhDv4kOOAPo94VpL0FqcReG1YSg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qAlQ4FANs9lRLXyGWQhpNKhlSiiob1/YzG0UD4DVhR+OfnKDWoTiDpETY8mNxu7gjFktxWWOp0z1Y6qfg+m7Bpy9LKFORi1RwOJm27AKuMEaOER+Jf9NMsQTrdF1QYRTsJAAi+w2WLc4JONlcXM3gSmLYPm9rdpcJnCocjkdbHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from ofsar (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E62FE340F55;
	Thu, 08 Jan 2026 05:25:06 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Encrow Thorne <jyc0019@gmail.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Troy Mitchell <troymitchell988@gmail.com>,
	Guodong Xu <guodong@riscstar.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/3] i2c: spacemit: add reset support
Date: Thu,  8 Jan 2026 13:24:37 +0800
Message-ID: <176784920500.341655.1244714161729055220.b4-ty@gentoo.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 30 Dec 2025 22:29:01 +0800, Encrow Thorne wrote:
> Add reset support for the K1 I2C driver. A reset ensures that the
> controller starts in a clean and known state.
> 
> Reset ensures that the I2C hardware is in a clean state. We cannot assume
> that no program used I2C before the kernel booted.
> 
> 
> [...]

Applied, thanks!

[3/3] riscv: dts: spacemit: add reset property
      https://github.com/spacemit-com/linux/commit/91c444d4285c07dbf2e6e4bf954d9a0282157f1f

Best regards,
-- 
Yixun Lan

