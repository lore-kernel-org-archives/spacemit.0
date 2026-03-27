Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D7234D4CB;
	Fri, 27 Mar 2026 11:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774611574; cv=none; b=fs9tYvW1EQ0WEKfG65m+edWBIDNJuqNYRNgKNIJ1wWfLCrQSGkWpguENtG9mkRE96foWGTvnNdq+lVm2cVkby6teSvLrq9xZZt7zeqkwoGqgn8GWEYVkt2olmp4j7xg513xFQiAxTp9fJU7MZEzo98EkwvWeqOFic8HhRaMKous=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774611574; c=relaxed/simple;
	bh=a/bpIagK/q6Fo+O8jZ6uB1SAOrF4Lf9H8hOIHssor2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ReN7HkzaFuYc4D7h28UkoRN9PVSqAZqkGwt47SzMJvU548OYNtC/0K3mhf/xeHLnj6InSKnOyauC1Saa7YIiIq97JOvsiS9cllWvGjX2cd33tHVKTZ5VNv5GmB3Gm6lrW3qJYMrNmqd74lm3iLR1LCiDsHmKuWRgszZsMGC3lk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGkF+hZJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGkF+hZJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40E33C19423;
	Fri, 27 Mar 2026 11:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611574;
	bh=a/bpIagK/q6Fo+O8jZ6uB1SAOrF4Lf9H8hOIHssor2U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QGkF+hZJ5CxTBfnAgqv9k1d4aOdUnaun1j2O7p70LUgzrP5rlyOPQDEq60sGXZYj+
	 /YAIb/7EbakISE8iiwEtb7JTyCl2cVRnNy+bpaPTn0WU+TjSgY14wMStbGNVYBjomn
	 Fg6zYPvx7f7p4D7356J3gNAvgHek8IoXF5Wbz3Ui6Zj7/SbwovzrEjfOHBMmmaO0wE
	 fLpIdDcG3sxUCcrMPKZppdUVMX5Kf75jDDg4xYvdnXAS5+cZZoLlSDtWXiikLXNjx3
	 hZFc3JDDxYU6llFm5iMW1BvIuBACJXXpZnsjbGvFgzZNMOnc6EsFnDVUYQVZ9h3I7h
	 DDbHrYWEmZ1YA==
From: Yixun Lan <dlan@kernel.org>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Aurelien Jarno <aurelien@aurel32.net>
Cc: Yixun Lan <dlan@kernel.org>,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 0/6] riscv: dts: spacemit: enable more devices on Milk-V Jupiter
Date: Fri, 27 Mar 2026 11:39:23 +0000
Message-ID: <177461153511.339472.17283642894074299016.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326183745.1370642-1-aurelien@aurel32.net>
References: <20260326183745.1370642-1-aurelien@aurel32.net>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 26 Mar 2026 19:35:28 +0100, Aurelien Jarno wrote:
> This patchset improves support of the Milk-V Jupiter board by enabling
> more devices. Most notably the NOR flash (useful for upgrading the
> bootloader), the USB 3 ports and the PCIe ports.
> 
> It was inspired by the Banana Pi F3 device tree file. It is based
> against the k1/dt-for-next branch and does not have any other
> dependency.
> 
> [...]

Applied, thanks!

[1/6] riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
      https://github.com/spacemit-com/linux/commit/334e64abacd3df4005de80b082d0dbf02b453c76
[2/6] riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
      https://github.com/spacemit-com/linux/commit/77156216f1d0f57e1cfce3452410db20468edca4
[3/6] riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
      https://github.com/spacemit-com/linux/commit/7af5edec73d5d69618541f91600adeb6f35b7d17
[4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
      https://github.com/spacemit-com/linux/commit/2829823956f0f590f5c6b4eafed2dab7a96f69b3
[5/6] riscv: dts: spacemit: enable USB 3 ports on Milk-V Jupiter
      https://github.com/spacemit-com/linux/commit/dce01d8585a22f708b5f1eb621cacd9878258ac8
[6/6] riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter
      https://github.com/spacemit-com/linux/commit/2b8bd26bbfcdeb1a06127dcd8f9101080133f2a1

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
