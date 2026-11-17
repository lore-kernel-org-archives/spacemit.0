Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908776;
	b=CoKtsDHWLSpI3LhGRV07OAYk1YngVwJW7zYNWJ5bmNgvXcHD6/c4PYYIh/bmwpHElEGF
	 EMFi61XlaKrIrJT1BiTT2FG06BhbRFnU+6sTPDRFYpzUsaHHVUL/2eia23EXn7XCvySI1
	 lgmrV7yGM1LpLg1kKUfJSHH5mck/tmOPTbuV3YvFis8u4MRkcTnWBAre6bGNzN53FbyiW
	 f1snyD8JqIl9M345W+lKwiDyDrMiSS2w32jWT8uBXCLQPz5QEgdFToxAieelkGDGWAcGH
	 //35QPfPaMUBYr7BoqCqhAgH2+h4oV71uY12zmqqqSV18m7qvdr+mtjXzCZy+/hJdDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908776;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=k/qijytVFIsC4oBmo7E3xWvc1VpP3rElv6FAFcCDtSk=;
	b=aRGh4XP2Q//1OL/jeJX8ZbcQkTTqf8O4bOw6RlANZLe5jLk9uWrmiKk08oaCXvLCvdrZ
	 RjNgIT1WZfKmhHq8auF8qswaal2rcfPYZz2w8eQtl1Xz53Zx0iVl4aK5D1kDIxG3XKQHq
	 MPNL3ghsLYOUbgFrYqKRKZ0CywR1rpVWJIhOUhso2pgVSupR3KSQWz/8bLv1+vc/AxYNp
	 0YvYvo7QXDNUyvkEi6+LTGQnWoAfIb1P38L3yXnYw7J0duxVVO+X5ZOyM8CXHZPx3tobf
	 39LsWpBvgK4vB7bsvCwcxsHENQyVrVMpE2GOgQsK8383l/exXhh5/EXrhWfgrBltV9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NsksbYKC;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC3F606A8AF
	for <spacemit@lists.linux.dev>; Tue, 17 Nov 2026 09:46:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8BC3F606A8AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NsksbYKC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794908739;
	bh=k/qijytVFIsC4oBmo7E3xWvc1VpP3rElv6FAFcCDtSk=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=NsksbYKCBbf74CXbp2CoijNV8Dy1YKY68Y3OD5vpZ4xqBPeseV+A2smdYkpKwm3oz
	 cf/9Y70ZBs5onXwxoV+x0Gn7VnhzxqmFjTZf3zfx+IbYilO5k5E4ULJIfEOLL4qblm
	 o0LdQ1/eXTVvoYtqUW6udiX2KDxKbssYJSKRux+E=
X-QQ-mid: zesmtpgz5t1794908738tf1d2ced2
X-QQ-Originating-IP: bsaj2xLaLCWn3mXT6bX46pVkGuckt9dXFHuXA9E85Rs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 17:45:34 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3879609612317059501
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 17 Nov 2026 09:45:13 +0000
Subject: [PATCH v2 5/5] MAINTAINERS: Add entry for SpacemiT timer
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-spacemit-soc-timer-v2-5-9264d0ea7755@linux.spacemit.com>
References: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
In-Reply-To: <20261117-spacemit-soc-timer-v2-0-9264d0ea7755@linux.spacemit.com>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=795;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=iHFUNkL4vpfnAkYRawlVPY3gFssiqBgZcrn/XNSsq1c=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/lNRtbkluXflVoUdQXUcwpN49M7TdsfTwioXmPAuZJ
 DcJ9bN1lLIwiHExyIopsnQ/4NlW4BNlWyBQ6Aszh5UJZAgDF6cATOTdBEaG20sSJhw60S1U+35G
 NFNfVzqf1oE44YSF1rJqP5e+e7pwHyPDR0nHMpaV5Wdrd7c+l311UKgnVK9kwtk7bUabNRezaV7
 nAwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NWth7vBa++GdiEWg+kbht02EjRzlnCDl34zyGu2pijraIMxYEHq7WB59
	J2IE4ul84CkxVsebT9N0GJGeT9Co2Y3z1giSzUgkhVU9Wtu/bGffCVlV75moc81PeWbcvNu
	eLro0Wi440L0++LUFuFUhsYD784o+IH2+K38SWTeGK5OPjDb4ULyEPyNcYWld3rwHXVGQEJ
	FImUMLkyvwqEFqw7kAZOCx+skPtRgSpgzvDxRMV6fAGoniApnFZ5NUmHuB/OHpXDSdlNhtR
	QFsoW85WVpGXxz2U8ocNTHB0abWdBcKLtaq06J3Hr2HzT5Z4fjMgOodnFDmST60wU7hmTFz
	NxfBDFi6HU8amLrPIc8wx5yq+8ybudPvFY3B/Udg1+355+sh8Qv5Qluz68jb9UHWXKjhJ9t
	QLG28la39f0571H2089Y0Dno/U3HAhYFxIoBSwjKnLcU1W7pzlQd1IhNfY+fBhcTsb4UTQ1
	VMyWp+xEkbwdgbte3MmuHay4tnRgsN19mIi+4nsdWUJlkWqB58xQZE+dVLwCqso0Ngt+YbM
	gfMol8WsbZJQND6qCX3m8lXQsIQFPiWHDL9Gx9WNk4k7C8Lg/j4FfTqisBYuwrBE5o5q1EW
	//lB6tqvVfIpOP3bODtjACdXohxiob2tRDi/mVSAJjKZPAI1tQsB45F5nbs7KAM/7H57KxX
	RVTzwug4wzkw7+QuJtxI8mGuJKtDTA+vXBQ5cWXIqJsNXEbbhwNdk3fbc4Ogs2hLl0cAep3
	rHb8ecF4MvKfLypN0X9XHOOMLErI0Wz3ubT1df+vupwbe18UCZjRSPG/Pt1V0l3a90PqkAH
	ymNNTmtGBqqrGUFy2JVjlP/zkiN0Csh48APucRjCzI29VPrH4wxyJL+LurYz1z6900LoYzO
	x48ho5AA8dJTABWUc+tJYWmCVTYA/bJbrcR+QI5nWjYY5DGnvz/E/B8ebB6C2eGWUbw8Vkd
	VFtV+6cC2QbJzLXBNiUSEQLm6A4A1Q0SKHKSxUnxIIduYIwZ+CjxhYt16hqFhPSl6TH/S3H
	b/WX2hoCnj3U1kOakbSZtzlMqzR7G0rRkEJBxmpZZx3EWCl0Yn/eqvsetssTJHJvjxtJ+IZ
	XIAdfeFOEHX
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Add a maintainer entry for the SpacemiT K1/K3 timer binding and
clocksource driver.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..e607e9cb07a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26372,6 +26372,12 @@ S:	Maintained
 F:	drivers/reset/spacemit/
 F:	include/dt-bindings/reset/spacemit,k3-resets.h
 
+SPACEMIT TIMER DRIVER
+M:	Troy Mitchell <troy.mitchell@linux.spacemit.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/timer/spacemit,k1-timer.yaml
+F:	drivers/clocksource/timer-spacemit.c
+
 SPANISH DOCUMENTATION
 M:	Carlos Bilbao <carlos.bilbao@kernel.org>
 R:	Avadhut Naik <avadhut.naik@amd.com>

-- 
2.56.0

