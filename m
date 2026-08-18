Received: from smtpbgsg1.qq.com (smtpbgsg1.qq.com [54.254.200.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 976FB305692
	for <spacemit@lists.linux.dev>; Tue, 18 Aug 2026 03:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787024525; cv=none; b=mfui3KRA25IZ9g3PZPQAwlLRPOFCNuUf1BMkbmVtFyxbYDcoeChieL/NdukNVt3LDAtvho6NBIa/yuzsaB3IT7lgt9rKyb49bxYy/Nn6EVVoiAN+I/nx6bKwoH3UR3dFCmD4FpJMMADzHwsVz23owdaWQvBD0FT5UQBSFWTEL2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787024525; c=relaxed/simple;
	bh=M51RcODKtDrycnFlhGskAMNyMf/YOS5ysox2HrmCLG4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PVbOdmVwDrF+snFYRlhjSZ0RsLLOyLVqdo/ldZwp2zVFvqcOnaYsgZEsbwYme9NY1aN1JryOpoJxjXH4nDgub4XcefyWQkvSVASe6adz+Fa9bX5Mjwamq7LxFZQ7mdM6Af5U5iYl655684+WI8/Ld38buoIq5qBpfaIFy/szvXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=WVKGl7QP; arc=none smtp.client-ip=54.254.200.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="WVKGl7QP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1787024479;
	bh=M51RcODKtDrycnFlhGskAMNyMf/YOS5ysox2HrmCLG4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=WVKGl7QPvSkOtgB9FnehwV273QauwKCUej0i5tKnE2d9v+/7fE5M3HupLPsFUwxfJ
	 gUQHf8UTF/HK/PibiDFgKNJVLRY+FVPz7Md14fhnrrMTOv/aGfscM+11O7vybPhrzV
	 6H/SyiyOu4CpYSgoYbj5XsZtV/78YKkHjiEncaf0=
X-QQ-mid: zesmtpsz7t1787024472t8d8f57af
X-QQ-Originating-IP: 8dt28FF39zpny7zVreDpqqEynBidAVsbYm5wAxeAed4=
Received: from SW-U22IC-015.dc.com ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 18 Aug 2026 11:41:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5519135494922037937
EX-QQ-RecipientCnt: 8
From: Peixin Xie <peixin.xie@linux.spacemit.com>
To: rafael@kernel.org
Cc: dlan@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	peixin.xie@linux.spacemit.com,
	spacemit@lists.linux.dev
Subject: Re: [PATCH] ACPI: scan: Drop power resource references for deferred devices
Date: Tue, 18 Aug 2026 11:41:10 +0800
Message-Id: <20260818034110.1067658-1-peixin.xie@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAJZ5v0g3pVxLgXBAHho5B+kfAiQQkQHGoO-1uBxp0OyXiGGcRQ@mail.gmail.com>
References: <CAJZ5v0g3pVxLgXBAHho5B+kfAiQQkQHGoO-1uBxp0OyXiGGcRQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MDN2VRNR2P4wfc1YnJSBHR339Xf5anZIzNaUsa/6XTxSaFIIPN8ib/wK
	SNL+AWZbWRW3avH2mUPiYKwvd4h90L4rxI9nEV+Mbxh15U2hZmI1FHB22N+Kdwv4iI38GdE
	w7tt7WNKR4BdwRwAMpGWj8iDsF59427O4nZqjW/nd0z3s/vzL1z8RJOKPnIWDsUGmEH5khi
	A43lYm9m6xBTDkHb1WbbHIpvZ/eCLmB/whrJJ+MMB0lP4+LLQnCEFu6G8fGU3zs104PZFnF
	HXUEqMaIIGJQCEQvd4KCYMklZm5Fnv8scVnXsEBnhXAITfN/jFWm2JpLGWa3Vg5J/c+HhlN
	Fbqbel3kFjhYXqNYMFvQtHEHJk73TdUEibbIYOE7xCJ/4rNw1J51o10jxuCYBEwN4Zv/qYi
	GwJQfAK7qjUecj7QPgTU/U6LuvWhGcnO8qayhQDFAow3EfAGHTb3Kb99IAY+EumrKBLpS0N
	aPhTTi3geWyxZ8yJYoGtUXmHP5/xalpN6UZPqa/YQcIRCk/MC9jGO1Hj9G5gVs6ZeDuAF7d
	01dyo3P0yHRArOfcEdXWSvyPdmXxZYm/8zH5p696EpujQTftCyeT8xdLFZzGbWxyCYqPfM3
	hQxd5ebgdHXVcbKpeIFQswHwCqVIUU3Jg7z56PMpTNflhQL+mDjdb/crdthBrUS+Zz2VvNO
	Qo9NBeS8bRd1QDmtBH5JNrmv1pU18FjtzyXIwXxKvl3PkO1MDFurwVmpq0kQjHEvWB5nmHV
	vLGauk3gZ66t92peCznI8bbm5FodbOY87Uep6XyBxYT1gAm0xFYFIx3oXt7SJz8W59fEKAh
	v6A4eOD3CroVzy534KW0xMa4KD2k79Z4D2y3MNVjyHLmr+DQfo8EJPTDvgko2hr9G3xG14P
	rkmDwKbUQBVcAFEzInaqimcGl6RmMZ/+JymudJmqK99hoD+DOmkWAdkfkUZc/09zYfuKW0/
	hrfa5UXxuRT9KAsgbNHVgzA09sHqp+gd/I8E08A9F9OwXqpLAVq73Y8JFiHPOLiWyTz9Is6
	jN//0bf8XwspvRjo6YLljehXl4wc0=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Wed, Aug 12, 2026 at 03:15:27PM +0200, Rafael J. Wysocki wrote:
> Have you considered dropping the acpi_bus_init_power() call from
> acpi_bus_get_power_flags() and doing it only once when the device gets
> ready for enumeration?

Thank you for the suggestion. I tested this approach on the SpacemiT K3
platform and it works as expected.

In addition to removing the acpi_bus_init_power() call, I set
device->flags.initialized to false at the end of acpi_bus_get_power_flags()
to mark the device power state as not yet initialized. This causes the
existing path in acpi_bus_attach() to call acpi_bus_init_power() once the
device is ready for enumeration.

The power resource references are now balanced and runtime suspend and
resume continue to work correctly. I will send a v2 in next couple days.
