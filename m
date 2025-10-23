Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C372C11F7
	for <spacemit@lists.linux.dev>; Thu, 23 Oct 2025 07:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761204597; cv=none; b=D6U9QkPCp5LvYnGXiQLf1s6/6OGUMjV2UWaMPB/9P31GwO9DRDcME+CtDTTe4uL+Ebdc3DXkSiHUUuWN3zlfpE7kZBRGcOPXVWYakiFFkiW7yxKLzyuXFzhaulpgrqy7MaG/XLWXmblPUavONnzpTqMwytr1bTIaFnc5iu/0bK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761204597; c=relaxed/simple;
	bh=we4sHnwFr+kEr7cdfMQWHMdmOTTe6rd9dsI0K+cOpEs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dXoX9jUKxtw4i1gX5FNGFRiC/ur/VUjBaNbWb5F7uAq5sTqaiWqGwo3weyPn1U9moMnZTsp+MZ6y+WOzJ0OblYIkCQW40eCYcCPrsEZ+RaOoJDdKIy0VOvWaNsHGR+xT4EPO4GoMV3VEWZCB7ZDxwLG9eXGNuXxE/O2WKVf9hGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=ie91+149; arc=none smtp.client-ip=54.204.34.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="ie91+149"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1761204517;
	bh=Z3g/Ci6Gk9u5rNQfKWFyfT6eJPSAgCXlQmbNL5h4HuE=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=ie91+149oa4QwBIki0XOsWFM3neJE8c73uAf/4zLZ2oqSjGnnFjiz9PidxMmkmhlL
	 R61kEu1WTfXNv0HWsJkzxX8JfS1iM98crezLoxvpsFIWzi2j8Cec3i8W+JfwT//lS5
	 woekrpvPKeZN/eHcqwSO4beryxdCim0lulHIxXjk=
X-QQ-mid: zesmtpsz3t1761204515ta40fe7d8
X-QQ-Originating-IP: 0tWTWnDeWGTQFbr43boTRKKu0iU8FLXKNlosicOA8tA=
Received: from = ( [221.4.210.170])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 23 Oct 2025 15:28:32 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15823541480981438499
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v4 0/2] riscv: dts: spacemit: add initial support for
 MusePi Pro
Date: Thu, 23 Oct 2025 15:28:28 +0800
Message-Id: <20251023-k1-musepi-pro-dts-v4-0-01836303e10f@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: spacemit@lists.linux.dev
List-Id: <spacemit.lists.linux.dev>
List-Subscribe: <mailto:spacemit+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:spacemit+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABzZ+WgC/23NQQ6DIBCF4as0rIsBRFq66j2aLhSHOmkVAkpsj
 HcvuurC5f+S+WYhEQJCJLfTQgIkjOiGHPJ8IqarhxdQbHMTwUTFtLjSN6f9FMEj9cHRdoy0kqo
 VzEgp6obkOx/A4rybj2fuDuPownd/kcS27hpnnB1oSVBGFfBGam6VLeH+wWGai+hrAz2OhXE92
 dhU/lOXI6rMlGQNq7KltLaH1LquPxJdf2EGAQAA
X-Change-ID: 20250928-k1-musepi-pro-dts-546d20c442ab
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yangyu Chen <cyy@cyyself.name>, 
 Paul Walmsley <pjw@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761204512; l=997;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=we4sHnwFr+kEr7cdfMQWHMdmOTTe6rd9dsI0K+cOpEs=;
 b=MZi6zYj1R9pH/t4TPsGChjG6bkItXX307IXO3J8l2f9VLBhLWa7TRJZiZTqpOPUJTkm32WzPJ
 ZVF8Z4/JCxFArIGCLPBpPdVbCQJJaz/eRIif10g336myXw2BgCWxf+p
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: N45sc01EPjPx26RiTNZpWwoHaOlXHixKA1vvoN0ygQYG5nKi2P266ic2
	gZigS1WeXi20/LDuokn95RYo4uvpAqT0sr08S7x8IpxN0qRd5AgatVsYMKQWVC7+VyOVZhH
	7OlbrYajnvJ3jNgatZjOPZMUWJxUtrKawZSV2rweX+0aAMXKN/ovAGgvXpasgX2JqZmBQLu
	UMRHepbylk0RkaToalM5HtoNv5FUqMqIjtF10uBNq+a8iEfsRqJlTwzyyLYlwAWV1Uukyn0
	2SdF7rNl55ToS3Pw1SkjG59lvEW9kHnVJpjbpsHDkfUY7dGkXPgX8Z260dKp9befg3OJxyC
	ls6QjSmIFCybB9o8G7+v+UL+PNwJRB9MfUUTcsocmVNPhyv6thEWF+s4p2MBdGaEwTHcfAq
	xL3GK79n+hKNUotveidkle6sXkvFxFyxmwGh0W7W1MyRCrxpqZLkjLv0nAYK8tDWU9lPH+N
	5o8SkaCmNdyu9WMN3dYlBopk1RBBgILfLu+GKGI96o/awB5vGYq1d/URLWB41cL+rumiU1X
	Rf80pTkv1+3Y2ETaQZNpTdVKJxERK/AdVO6wUsAsexrvlkou1uhX8dJje8RnwYZWL/4/pYJ
	4HtK/u1YFoV5QFk7Pwm5FRok8GmlJ6zC2BODESto5xaUMdnszxgUHrPtAQgiNzAJhXMxN/y
	ZIu21ZnmQ/dS9jeorR4rJ4cv4FaWXrRo+QhbfDMsiEe9F5zI8cZ3J/KD6ty4bT8c5XrHo3l
	PCvJ5gsErKNao+NtwnrW/V13hVYaLTu6RJO4O26YmHF/7kCVCilAPFWsWi84xbIaO2eLfwG
	ONJrBqOTVwoVN/6zZxSatExFwRmQsLxyTOf6RqOEid92omI25OQBpy5MnNm9S6J38bME6xj
	IVU7ILCkFy+rbtrNrdlnr7C5lyHRL7UwuvJroaJXsPqY/Z8xYvm9e7bGQwS4o6hdgaEybPs
	7z1PfLhTMkP3GniyxPFEJU+FkY1TUr1TH5S9+/N57shG6h9UcUtCqOwoit5MTNzoQScgXIX
	NP5HQRwQMcMsYQSl840IwDXjj+hpBKS/e7uflc+2bwJOPzJtktzxVyoQh02Uy9NzKos2aG9
	gAFBz2qiRpr44vPbhEcFnYENscjEd0jLI7IYE7x1DZ8imUl+C7aG/py2eMoHPYJmrowACOo
	KQqisjOp6Clrly0=
X-QQ-XMRINFO: Nq+8W0+stu50PRdwbJxPCL0=
X-QQ-RECHKSPAM: 0

This patchset adds initial device tree support for the MusePi Pro board.

Muse Pi Pro [1] is a single-board computer integrating a high-performance
RISC-V 8-core processor, storage, I/O and expansion capabilities into
a credit card-sized 1.8-inch board.

Link:
https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf
[1]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      dt-bindings: riscv: spacemit: add MusePi Pro board
      riscv: dts: spacemit: add MusePi Pro board device tree

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts     | 79 ++++++++++++++++++++++
 3 files changed, 81 insertions(+)
---
base-commit: 6296cd4c05cbcf06725777ded1ef44ab987a9cfd
change-id: 20250928-k1-musepi-pro-dts-546d20c442ab

Best regards,
-- 
Troy Mitchell <troy.mitchell@linux.spacemit.com>

